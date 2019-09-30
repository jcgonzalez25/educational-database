var s = cat('./CoffeeShops.json').split('\n');;
s.pop();
db.shops.insert(s.map(JSON.parse));
