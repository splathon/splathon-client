importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

const hostname = location.hostname;
const firebaseConfig = (() => {
  switch (hostname) {
    case 'splathon-11.netflify.com':
      // Splathon 11 Prod
      return {
        apiKey: 'AIzaSyDiyDbACBaXpsb_gk3fexXlCMWH2L1KKgc',
        appId: '1:734554279859:web:6110c5ee1ffe5025d305c6',
        messagingSenderId: '734554279859',
        projectId: 'splathon-11-apps',
        authDomain: 'splathon-11-apps.firebaseapp.com',
        storageBucket: 'splathon-11-apps.appspot.com',
        measurementId: 'G-736DWE0L47',
      }
    case 'splathon-12.netlify.com':
      // Splathon 12 Prod
      return {
        apiKey: 'AIzaSyBCfob6fChIhgtzU1eYfMmJq9yZE7KOYLs',
        appId: '1:535644394524:web:6187254643929374b3fbd9',
        messagingSenderId: '535644394524',
        projectId: 'splathon-12-apps',
        authDomain: 'splathon-12-apps.firebaseapp.com',
        storageBucket: 'splathon-12-apps.appspot.com',
        measurementId: 'G-9QKJYCT4M4',
      };
    case 'splathon-12-stg.netlify.com':
      // Splathon 12 Stg
      return {
        apiKey: 'AIzaSyAkwzgRq79oauD0iRW-V9jul68gSuoGTpk',
        appId: '1:961836068991:web:4299e0af29450af123cf4a',
        messagingSenderId: '961836068991',
        projectId: 'splathon12-stg-apps',
        authDomain: 'splathon12-stg-apps.firebaseapp.com',
        storageBucket: 'splathon12-stg-apps.appspot.com',
        measurementId: 'G-1BRK77KYQ7',
      }
    case 'localhost':
    case 'splathon-11-stg.netlify.com':
    default:
      // Splathon 11 Stg
      return {
        apiKey: 'AIzaSyDEOu6TYVVr8OCoFzFYkU_6d4_0dR8ZlEM',
        appId: '1:956773548726:web:3fc462840aa074d20b9c17',
        messagingSenderId: '956773548726',
        projectId: 'splathon11-stg-apps',
        authDomain: 'splathon11-stg-apps.firebaseapp.com',
        storageBucket: 'splathon11-stg-apps.appspot.com',
        measurementId: 'G-YBZJ41B8L9',
      };
  }
})();

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

// background messsage
messaging.onBackgroundMessage((m) => {
  const notificationTitle = m.notification.title ?? 'お知らせ';
  const notificationOptions = {
    body: m.notification.body,
    icon: 'https://avatars.githubusercontent.com/u/16331293',
  };
  self.registration.showNotification(notificationTitle, notificationOptions);
});