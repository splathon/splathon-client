'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "splash/style.css": "a43a23c4fc1c4d6f57a9d5ce27079888",
"splash/img/dark-1x.png": "a19f40b1445b9adca44f2c65e8551e44",
"splash/img/dark-2x.png": "b075b408ddb2be19808b21ec3303dcb8",
"splash/img/light-4x.png": "7e87df9171a5a4f81a89e6c2f5f0ed74",
"splash/img/light-3x.png": "3ea7704c447f70eed842ecc3b8356361",
"splash/img/dark-3x.png": "3ea7704c447f70eed842ecc3b8356361",
"splash/img/light-2x.png": "b075b408ddb2be19808b21ec3303dcb8",
"splash/img/light-1x.png": "a19f40b1445b9adca44f2c65e8551e44",
"splash/img/dark-4x.png": "7e87df9171a5a4f81a89e6c2f5f0ed74",
"splash/splash.js": "123c400b58bea74c1305ca3ac966748d",
"version.json": "e8f352fe468ded0e804cff4f26a7f00f",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"favicon.png": "d49f651335eeacb6e386fc384f9df2bc",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"index.html": "315de68a04ea67c6dbbcc0c59e6baab7",
"/": "315de68a04ea67c6dbbcc0c59e6baab7",
"manifest.json": "57d885a3a840d5835ac0439eb3345466",
"main.dart.js": "932be809c9ded580fe9c57e5e87879b0",
"firebase-messaging-sw.js": "2d0c653f5158a4f572ead021a0a6a3e8",
"assets/AssetManifest.json": "f3a598bce8c1252e1494f4525e45c940",
"assets/env/dotEnv.spl11stg": "a37d4210a299024323c63bce51e897d2",
"assets/env/dotEnv.stg": "5ff79cf55d5f172298b1883a4fb40339",
"assets/env/dotEnv.spl12": "d472afaa7da15c7a18ee24675b8ebaa3",
"assets/env/dotEnv.prod": "73106d790d0d82660d8e1b39a3612eb5",
"assets/env/dotEnv.spl11": "6111cb418eb25dc7b84d765c582aaf47",
"assets/FontManifest.json": "5f75d211dd7a2ec77767426f8ead06b6",
"assets/NOTICES": "1150711466c313cb4a6666ced4cd9192",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/images/boy_and_girl.png": "2c43d29c6c40357e46597651bc551545",
"assets/assets/images/arrowDownW.png": "03579ece9736cd8b8eec28610165d7cb",
"assets/assets/images/2.0x/arrowDownW.png": "d9fbc2f7f3624459a0fd7e5edbb44593",
"assets/assets/images/2.0x/crown2.png": "1818d9cfa5afd3f2c09d3952a5e30728",
"assets/assets/images/2.0x/crown3.png": "4f9918c335b68fb0747f7b8317641376",
"assets/assets/images/2.0x/crown1.png": "2c23674df7fff4f2dd3e23043cc3d6d2",
"assets/assets/images/2.0x/goldInc.png": "16c199985c49fd09d702b81973d25df2",
"assets/assets/images/2.0x/reloadIcon.png": "8e21f431d4fed286096ea214122fccf0",
"assets/assets/images/2.0x/girl.png": "b9c6ec6277df2c454eef44f8dd376983",
"assets/assets/images/2.0x/icon_ranking.png": "a192e762790c4edcc56adbddf1904bc0",
"assets/assets/images/2.0x/arrowRight.png": "7f3938025a11aae2615653e797caee1e",
"assets/assets/images/2.0x/silverInc.png": "eafe3ab5b9bc7e93494a50e945118a73",
"assets/assets/images/2.0x/icon_reception.png": "5e0aef28830c4cb68f9fa543bb787ba1",
"assets/assets/images/2.0x/icon_notification.png": "b488c49cabd8dd2ea836fd75af3ea2e5",
"assets/assets/images/2.0x/icon_result.png": "7cd399fb788eb6475bf51434611f2494",
"assets/assets/images/2.0x/arrowUp.png": "61c000e9b46eefc0c3482eb04a8360a5",
"assets/assets/images/crown2.png": "2595ba741bf22a57b9f6b2ebded55498",
"assets/assets/images/crown3.png": "a98bb06067a33792d23fc0ca49084632",
"assets/assets/images/crown1.png": "e7528bc5ee561d8f0bf67477319b470d",
"assets/assets/images/goldInc.png": "e37670a92c502ed879477a00bd2a3402",
"assets/assets/images/reloadIcon.png": "835808794bc0c905b5975352dedd3efd",
"assets/assets/images/girl.png": "299a5163343ee296f80bb2fb43f49a95",
"assets/assets/images/3.0x/arrowDownW.png": "7c1b14ebb7f3b73c14975102e59e5051",
"assets/assets/images/3.0x/crown2.png": "c4ff40acfeee805f86927df35e8c0ed7",
"assets/assets/images/3.0x/crown3.png": "a3539fb6624cbb2d99bfdb62ab4c75d2",
"assets/assets/images/3.0x/crown1.png": "51ebc0965f79f9ff6c33072a3b110188",
"assets/assets/images/3.0x/goldInc.png": "dcfa55fd10990e3d9339cc85b199dfc1",
"assets/assets/images/3.0x/reloadIcon.png": "56fe424339b261d428a478e0d1ceb2f4",
"assets/assets/images/3.0x/girl.png": "d894e8a9365e379702d9688b04ab1dff",
"assets/assets/images/3.0x/icon_ranking.png": "0eac9e2713d8a33d41e44c17731c6629",
"assets/assets/images/3.0x/arrowRight.png": "4ffdb3c33ad8b341717aec169142c22d",
"assets/assets/images/3.0x/silverInc.png": "67cd681c0c0cac04b7cec731cce43ff6",
"assets/assets/images/3.0x/icon_reception.png": "26ea6d74ae15f419f60e4289155eeffe",
"assets/assets/images/3.0x/icon_notification.png": "046eba24297fc63e528f398a49a7a3d6",
"assets/assets/images/3.0x/icon_result.png": "0bb430f4c3b1531cd4a546bc66235702",
"assets/assets/images/3.0x/arrowUp.png": "a0d905e09bd67de96cae2c9d4b63ddf0",
"assets/assets/images/icon_ranking.png": "2be236b3fa36ad2b1fba624f5fded061",
"assets/assets/images/arrowRight.png": "75a92020a1f414beb0faa2e43d3ae1eb",
"assets/assets/images/silverInc.png": "34de8c654af09f54e7386005e56ccbdf",
"assets/assets/images/icon_reception.png": "6a854051988c59427a93632756aa763e",
"assets/assets/images/boys.png": "8aca195af6b9ee30a71cd67b661130df",
"assets/assets/images/icon_notification.png": "f277270c4905662db3e980373017bf56",
"assets/assets/images/icon_result.png": "8ebb08b92f41320e6e23866e5b3888df",
"assets/assets/images/arrowUp.png": "6129b7a51262ca95fbaae4fdb4dc555b",
"assets/assets/fonts/Splatfont.ttf": "c6e7981c7a6d6f37bbdfd62d607a7f1b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/shaders/ink_sparkle.frag": "0cfae77e432d12ec44627f8d9eacbc65",
"icons/Icon-maskable-192.png": "748fb19b0f82c75f0b06cc49d36d0f69",
"icons/Icon-maskable-512.png": "f7ae8f673d55bcd9b0c500a357cc5050",
"icons/Icon-192.png": "748fb19b0f82c75f0b06cc49d36d0f69",
"icons/Icon-512.png": "f7ae8f673d55bcd9b0c500a357cc5050"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
