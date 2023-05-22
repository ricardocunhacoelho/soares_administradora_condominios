
/* eslint-disable */
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const mkdirp = require('mkdirp');

admin.initializeApp();
const stripe = require('stripe')(functions.config().stripe.testkey)

const db = admin.firestore();
// const { Storage } = require('@google-cloud/storage');

// Creates a client
// const storage = new Storage();

const spawn = require('child-process-promise').spawn;
const path = require('path');
const os = require('os');

// Max height and width of the thumbnail in pixels.
const THUMB_MAX_HEIGHT = 200;
const THUMB_MAX_WIDTH = 200;
// Thumbnail prefix added to file names.
const THUMB_PREFIX = 'thumb_';

exports.onVisitorCreate = functions.firestore.document('visitors/{visitorId}').onCreate(async (snap) => {
    const values = snap.data();
    admin.firestore().doc("adm/visitors").get()
        .then(areaSnapshot => {
            const listVisitor = areaSnapshot.data().visitors as Array<any>;

            listVisitor.push(values);
            db.collection('adm').doc('visitors').update({ 'visitors': listVisitor });
        }).catch((error) => {
            console.log(error)
        })

})
exports.onResidentCreate = functions.firestore.document('residents/{residentId}').onCreate(async (snap) => {
    const values = snap.data();
    admin.firestore().doc("adm/residents").get()
        .then(areaSnapshot => {
            const listResident = areaSnapshot.data().residents as Array<any>;

            listResident.push(values);
            db.collection('adm').doc('residents').update({ 'residents': listResident });
        }).catch((error) => {
            console.log(error)
        })

})
exports.onHome_UnitsCreate = functions.firestore.document('home_units/{home_unitId}').onCreate(async (snap) => {
    const values = snap.data();
    admin.firestore().doc("adm/home_units").get()
        .then(areaSnapshot => {
            const listHome_Units = areaSnapshot.data().home_units as Array<any>;

            listHome_Units.push(values);
            db.collection('adm').doc('home_units').update({ 'home_units': listHome_Units });
        }).catch((error) => {
            console.log(error)
        })

})
exports.onHouse_Service_ProvidersCreate = functions.firestore.document('house_service_providers/{home_unitId}').onCreate(async (snap) => {
    const values = snap.data();
    admin.firestore().doc("adm/house_service_providers").get()
        .then(areaSnapshot => {
            const listhouse_service_providers = areaSnapshot.data().house_service_providers as Array<any>;

            listhouse_service_providers.push(values);
            db.collection('adm').doc('house_service_providers').update({ 'house_service_providers': listhouse_service_providers });
        }).catch((error) => {
            console.log(error)
        })

})
export const newVote = functions.firestore
    .document('user_polling_responses/{user_polling_response_id}')
    .onWrite(contador);

async function contador(change: any, context: any) {
    const valorAntigo = change.before.exists ? change.before.data() : null;
    const valorNovo = change.after.exists ? change.after.data() : null;


    var batch = db.batch();

    var newVoteRef = db.doc(`pollings/${valorNovo.id_polling}`);


    if (valorAntigo != null) {

        if (valorNovo.pollingChange == 0) {
            if (valorNovo.vote == 1) {

                batch.set(newVoteRef, { votesYes: admin.firestore.FieldValue.increment(1) }, { merge: true });
            } if (valorNovo.vote == 0) {

                batch.set(newVoteRef, { votesNo: admin.firestore.FieldValue.increment(1) }, { merge: true });
            }

        }
        if (valorNovo.pollingChange == 1) {
            if (valorNovo.vote == 1) {
                batch.set(newVoteRef, { votesNo: admin.firestore.FieldValue.increment(-1) }, { merge: true });

                batch.set(newVoteRef, { votesYes: admin.firestore.FieldValue.increment(1) }, { merge: true });
            } else {
                batch.set(newVoteRef, { votesNo: admin.firestore.FieldValue.increment(1) }, { merge: true });

                batch.set(newVoteRef, { votesYes: admin.firestore.FieldValue.increment(-1) }, { merge: true });
            }

        }
    }
    if (valorAntigo == null && valorNovo != null) {
        if (valorNovo.vote == 1) {

            batch.set(newVoteRef, { votesYes: admin.firestore.FieldValue.increment(1) }, { merge: true });
        } if (valorNovo.vote == 0) {

            batch.set(newVoteRef, { votesNo: admin.firestore.FieldValue.increment(1) }, { merge: true });
        }
    }

    return await batch.commit();
}
const generateResponse = function (intent) {
    switch (intent.status.toString()) {
        case 'requires_action':
            return {
                clientSecret: intent.client_secret,
                requiresAction: true,
                status: intent.status,
            };
        case 'requires_payment_method':
            return {
                'error': 'Seu cartão foi negado, por favor providencie um cartão válido ou outro método de pagamento'
            };
        case 'succeeded':
            console.log('Pagamento efetuado com sucesso.');
            return {
                clientSecret: intent.client_secret, status: intent.status,
            };
        default:
            return { error: `falha erro oq vem no intent status: ${intent.status} ` };
    }

}
// const calculateOrderAmount = async (item) => {
//     admin.firestore().doc(`area_condominium/${item}`).get().then(areaSnapshot => {
//         const price = +areaSnapshot.data().price;
//         db.collection('testar').doc('teste').update({ 'outro': 'teste' });
//         db.collection('testar').doc('teste').update({ 'ver': price });

//     }).catch((error) => {
//         console.log(error)
//     })


// }
exports.StripePayEndpointMethodId = functions.https.onRequest(async (req, res) => {
    const { paymentMethodId, item, currency, useStripeSdk, } = req.body;
    const orderAmount = Math.floor( +item * 100 );

    try {
        if (paymentMethodId) {
            const params = {
                amount: orderAmount,
                confirm: true,
                confirmation_method: 'manual',
                currency: currency,
                payment_method: paymentMethodId,
                use_stripe_sdk: useStripeSdk,
            }
            const intent = await stripe.paymentIntents.create(params);
            console.log(`Intent: ${intent}`);
            return res.send(generateResponse(intent));
        }
        return res.sendStatus(400)
    } catch (e) {
        if (e instanceof Error)
            return res.send({ error: e.message });
    }
});
exports.StripePayEndpointIntentId = functions.https.onRequest(async (req, res) => {
    const { paymentIntentId } = req.body;
    try {
        if (paymentIntentId) {
            const intent = await stripe.paymentIntents.confirm(paymentIntentId);
            return res.send(generateResponse(intent));
        }
        return res.sendStatus(400)
    } catch (e) {
        if (e instanceof Error)
            return res.send({ error: e.message });
    }
});
exports.generateThumbnail = functions.storage.object().onFinalize(async (object) => {
    // File and directory paths.
    const filePath = object.name;
    const contentType = object.contentType; // This is the image MIME type
    const fileDir = path.dirname(filePath);
    const fileName = path.basename(filePath);
    const thumbFilePath = path.normalize(path.join(fileDir, `${THUMB_PREFIX}${fileName}`));
    const tempLocalFile = path.join(os.tmpdir(), filePath);
    const tempLocalDir = path.dirname(tempLocalFile);
    const tempLocalThumbFile = path.join(os.tmpdir(), thumbFilePath);

    // Exit if this is triggered on a file that is not an image.
    if (!contentType.startsWith('image/')) {
        return functions.logger.log('This is not an image.');
    }

    // Exit if the image is already a thumbnail.
    if (fileName.startsWith(THUMB_PREFIX)) {
        return functions.logger.log('Already a Thumbnail.');
    }

    // Cloud Storage files.
    const bucket = admin.storage().bucket(object.bucket);
    const file = bucket.file(filePath);
    // const thumbFile = bucket.file(thumbFilePath);
    const metadata = {
        contentType: contentType,
        // To enable Client-side caching you can set the Cache-Control headers here. Uncomment below.
        // 'Cache-Control': 'public,max-age=3600',
    };

    // Create the temp directory where the storage file will be downloaded.
    await mkdirp(tempLocalDir)
    // Download file from bucket.
    await file.download({ destination: tempLocalFile });
    functions.logger.log('The file has been downloaded to', tempLocalFile);
    // Generate a thumbnail using ImageMagick.
    await spawn('convert', [tempLocalFile, '-thumbnail', `${THUMB_MAX_WIDTH}x${THUMB_MAX_HEIGHT}>`, tempLocalThumbFile], { capture: ['stdout', 'stderr'] });
    functions.logger.log('Thumbnail created at', tempLocalThumbFile);
    // Uploading the Thumbnail.
    bucket.upload(tempLocalThumbFile, { destination: thumbFilePath, metadata: metadata }).then(async newImage => {
        const file2 = bucket.file(thumbFilePath);
        if (thumbFilePath.toString().startsWith('images/profile')) {
            file2.getSignedUrl({
                action: 'read',
                expires: '03-09-2491'
            }).then(signedUrls => {
                db.collection('users').doc('test').update({ 'profileImageThumb': signedUrls[0] });
                db.collection('users').doc('test').update({ 'doc': fileName.substring(0, 28) });
                db.collection('users').doc(fileName.substring(0, 28).toString()).update({ 'profileImageThumb': signedUrls[0] });
            }).catch((error) => {
                db.collection('testar').doc('teste').update({ 'erro': `erro : ${error.toString()}` });
            })
        }




    }).catch((error) => {
        console.log(error)
    })
});