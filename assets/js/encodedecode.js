var he = require('he');


message = he.encode(process.argv[2],
		{'encodeEverything': true,
		 'useNamedReferences': true});

console.log(message);
console.log(he.decode(message));
