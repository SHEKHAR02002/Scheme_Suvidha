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

export const statusNotification = functions
  .region("asia-south1")
  .firestore.document("Users/{userId}")
  .onUpdate(async (snapshot, context) => {
    var oldUserDetails = snapshot.before.data();
    var userDetails = snapshot.after.data();
    var userId = context.params.userId;

    var checkNotifcationCenter = await db
      .doc(`NotificationCenter/${userId}`)
      .get()
      .then((value) => value.exists);
    if (checkNotifcationCenter) {
      var getNotificationDetails = (checkNotifcationCenter = await db
        .doc(`NotificationCenter/${userId}`)
        .get()
        .then((value) => value.data()));
    }

    if (
      !userDetails["registeration"] &&
      oldUserDetails["msg"] != userDetails["msg"] &&
      userDetails["msg"] != ""
    ) {
      const payload = {
        token: userDetails["token"].toString(),
        notification: {
          title: "Scheme Suvidha",
          body: `Your registeration is rejected due to, ${userDetails["msg"]}.`,
        },
        data: {
          body: `You have completed the registeration , Your Application will be verify soon.`,
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
    }
    if (!checkNotifcationCenter && userDetails["registeration"]) {
      await db.doc(`NotificationCenter/${userId}`).create({
        name: userDetails["name"],
        registeration: true,
        verification: false,
        sendVerificationNotification: false,
      });
      const payload = {
        token: userDetails["token"].toString(),
        notification: {
          title: "Scheme Suvidha",
          body: `You have completed the registeration , Your Application will be verify soon.`,
        },
        data: {
          body: `You have completed the registeration , Your Application will be verify soon.`,
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
    }

    if (
      checkNotifcationCenter &&
      !getNotificationDetails["sendVerificationNotification"]
    ) {
      await db.doc(`NotificationCenter/${userId}`).update({
        verification: true,
        sendVerificationNotification: true,
      });
      const payload = {
        token: userDetails["token"].toString(),
        notification: {
          title: "Scheme Suvidha",
          body: `Your Application have been verified , Now you can apply for any schemes`,
        },
        data: {
          body: `Your Application have been verified , Now you can apply for any schemes`,
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
    }

    return Promise.resolve();
  });
