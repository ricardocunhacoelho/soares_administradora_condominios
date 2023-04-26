
/* eslint-disable */
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const db = admin.firestore();

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