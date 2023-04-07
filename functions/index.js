import functions, { https } from "firebase-functions";
import admin from "firebase-admin";
import { StoreNoification } from "./notification.js";
import serviceAccount from "./serviceAccountKey.json" assert { type: "json" };
import { AutoScheme } from "./autoscheme.js";
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

export const db = admin.firestore();

// Api for AutoScheme verification
export const autoSchemeChecker = functions
  .region("asia-south1")
  .https.onRequest(async (req, res) => {
    var applicationId = req.params["id"];
    await AutoScheme({ id: applicationId });
  });

// onCreate function when the application is submited by the user applying for a scheme
export const onCreatedApplication = functions
  .region("asia-south1")
  .firestore.document("Application/{applicationId}")
  .onCreate(async (snapshot, context) => {
    var applicationId = context.params.applicationId;
    var applicationData = snapshot.data();

    var userDetails = await db
      .doc(`Users/${applicationData["userId"]}`)
      .get()
      .then((value) => value.data());

    const payload = {
      token: userDetails["token"].toString(),
      notification: {
        title: "Scheme Suvidha",
        body: applicationData["status"],
      },
      data: {
        body: applicationData["status"],
      },
    };
    await StoreNoification({
      userid: userDetails["userId"],
      msg: applicationData["status"],
    });
    await AutoScheme({ id: applicationId });
    await admin
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

    return Promise.resolve();
  });

//  user status of scheme
export const statusOfScheme = functions
  .region("asia-south1")
  .firestore.document("Application/{applicationId}")
  .onUpdate(async (snapshot, context) => {
    var newApplicationData = snapshot.after.data();
    var oldApplicationData = snapshot.before.data();

    var userDetails = await db
      .doc(`Users/${newApplicationData["userId"]}`)
      .get()
      .then((value) => value.data());

    if (
      newApplicationData["status"] != oldApplicationData["status"] &&
      newApplicationData["progress"] != oldApplicationData["progress"]
    ) {
      const payload = {
        token: userDetails["token"].toString(),
        notification: {
          title: "Scheme Suvidha",
          body: newApplicationData["status"],
        },
        data: {
          body: newApplicationData["status"],
        },
      };
      await StoreNoification({
        userid: userDetails["userId"],
        msg: newApplicationData["status"],
      });
      await admin
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
  });

// Alert for new scheme launch by the app
export const newschemeAlert = functions
  .region("asia-south1")
  .firestore.document("Schemes/{schemeId}")
  .onCreate(async (snapshot, context) => {
    await db
      .collection("Users")
      .get()
      .then(async (users) => {
        users.docs.forEach(async (user) => {
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
          await StoreNoification({
            userid: user.data()["userId"],
            msg: `New Scheme is arrived`,
          });
          await admin
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

// The verification and registeration status of the user
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
          body: `Your registeration is rejected due to, ${userDetails["msg"]}.`,
        },
      };
      await StoreNoification({
        userid: userDetails["userId"],
        msg: `Your registeration is rejected due to, ${userDetails["msg"]}.`,
      });
      await admin
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
          body: `You have completed the registration , Your Application will be verified soon.`,
        },
        data: {
          body: `You have completed the registration , Your Application will be verified soon.`,
        },
      };
      await StoreNoification({
        userid: userDetails["userId"],
        msg: `You have completed the registration , Your Application will be verified soon.`,
      });
      await admin
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
          body: `Your Application has been verified , Now you can apply for any schemes`,
        },
        data: {
          body: `Your Application has been verified , Now you can apply for any schemes`,
        },
      };
      await StoreNoification({
        userid: userDetails["userId"],
        msg: `Your Application has been verified , Now you can apply for any schemes`,
      });

      await admin
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
