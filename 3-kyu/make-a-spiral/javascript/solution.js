
function spiralize(n) {
  let result = new Array(n);
  for (let i = 0; i < result.length; i++) {
    result[i] = new Array(n);
    for (let j = 0; j < result[i].length; j++) {
      result[i][j] = 0;
    }
  }

  for (let m = 0; m < result[0].length; m++) {
    result[0][m] = 1;
  }

  let sideLength = result[0].length - 1,
    steps = 0,
    coords = [result[0].length - 1, 1]
  dir = 0;

  while (sideLength > 0) {
    result[coords[1]][coords[0]] = 1;
    steps++;

    if (sideLength === 1) break;

    if (steps === sideLength) {
      dir++;
      dir = dir > 3 ? 0 : dir;
      steps = 0;
      sideLength = (dir === 0 || dir === 2) ? sideLength - 2 : sideLength;
    }

    switch (dir) {
      case 0:
        coords[1]++;
        break;
      case 1:
        coords[0]--;
        break;
      case 2:
        coords[1]--;
        break;
      case 3:
        coords[0]++;
        break;
    }
  }
  return result;
}
