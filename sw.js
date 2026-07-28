const CACHE = 'recipe-box-v2';
const ASSETS = ['./', './index.html', './manifest.json', './Josephs-Recipe-Book.pdf', './apple-touch-icon.png', './icon-192.png', './icon-512.png', './favicon-32.png'];

self.addEventListener('install', (e)=>{
  e.waitUntil(caches.open(CACHE).then(cache => cache.addAll(ASSETS)));
  self.skipWaiting();
});

self.addEventListener('activate', (e)=>{
  e.waitUntil(
    caches.keys().then(keys => Promise.all(
      keys.filter(k => k !== CACHE).map(k => caches.delete(k))
    ))
  );
  self.clients.claim();
});

// Network-first: always try to fetch the latest version first (so repo updates
// show up on reload), and only fall back to the cached copy when offline.
self.addEventListener('fetch', (e)=>{
  if(e.request.method !== 'GET') return;
  // Never intercept calls to Supabase or any other API - those must always hit the network.
  if(!e.request.url.startsWith(self.location.origin)) return;

  e.respondWith(
    fetch(e.request).then(res => {
      const resClone = res.clone();
      caches.open(CACHE).then(cache => cache.put(e.request, resClone));
      return res;
    }).catch(() => caches.match(e.request))
  );
});
