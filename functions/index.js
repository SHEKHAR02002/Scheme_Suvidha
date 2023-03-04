import functions from "firebase-functions";
import admin from "firebase-admin";

import serviceAccount from "./serviceAccountKey.json" assert { type: "json" };
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();

export const newschemeAlert = functions
  .region("asia-south1")
  .firestore.document("Schemes/{schemeId}")
  .onCreate(async (snapshot, context) => {
    await db
      .collection("Users")
      .get()
      .then(async (users) => {
        users.docs.forEach((user) => {
          const payload = {
            token: user.data()["token"].toString(),
            notification: {
              title: "Scheme Suvidha",
              body: `New Scheme is arrived`,
            },
            data: {
              body: `New Scheme is arrived`,
            },
          };
          admin
            .messaging()
            .send(payload)
            .then((response) => {
              // Response is a message ID string.
              console.log("its working");
              console.log("Successfully sent message:", response);
            })
            .catch((error) => {
              console.log("error:", error.code);
            });
        });
      });

    return Promise.resolve();
  });
