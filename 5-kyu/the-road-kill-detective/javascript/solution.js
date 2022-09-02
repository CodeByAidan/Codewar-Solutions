// hyyyyyyeeeena
// hyena
// pennnnnnnnnguiiiiiiinnn
// penguin
// rrrrrraeeebbb
// beaar

/*
// console.log(ANIMALS);

var roadKill = function(photo) {
  // Your code here!
  return "??"
}
*/



var roadKill = function(photo) {
  let identify = photo.replace(/=/g, "").split(''), char = identify[0], patt = [], i = 1, counter = 1;
  if (identify.length == 0 || photo.match(/[$\s\d]/)) {return "??"};
  while (i <= identify.length) {
    if (i == identify.length) {
      pattern = `^${patt.reduce((p, ar) => {return p += `${ar[0]}{1,${ar[1]}}`}, "")}${char}{1,${counter}}$`;
      reversePattern = `^${char}{1,${counter}}${patt.reverse().reduce((p, ar) => {return p += `${ar[0]}{1,${ar[1]}}`}, "")}$`;
    } else if (identify[i] === char) {
      ++counter;
    } else {
      patt.push([char, counter]);
      char = identify[i];
      counter = 1;
    }
    ++i;
  }

  let check = ANIMALS.filter(animal => animal.match(pattern));
  let checkReverse = ANIMALS.filter(animal => animal.match(reversePattern));

  if (check.length) {
    return check[0];
  } else if (checkReverse.length) {
    return checkReverse[0];
  } else {
    return "??";
  }
}

var assert = require('assert');
assert.equal(roadKill("==========h===yyyyyy===eeee=n==a========"), "hyena")
assert.equal(roadKill("======pe====nnnnnn=======================n=n=ng====u==iiii=iii==nn========================n="), "penguin")
assert.equal(roadKill("=====r=rrr=rra=====eee======bb====b======="), "bear")