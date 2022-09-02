
// have spent some time understanding and re-training on this one
// here is a fairly explicit soultion using recursion and a shortcut
// for indexing. there plenty of room for improvement but already
// executes in significantly less steps than the "top" solution
// though main goal was simplicity and readability


function decompose(n, n2 = n * n) {
    let arr = [];

    let i = n - 1;
    if (i > almostRoot(n2)) i = almostRoot(n2);

    while (i > 0) {
        let i2 = i * i;
        let difference = n2 - i2;

        if (difference > 0) {
            let result = decompose(i, difference);
            if (result) {
                arr = arr.concat(result);
                arr.push(i);
                return arr;
            }
        }

        if (difference === 0) {
            arr.push(i);
            return arr;
        }

        i--;
    }

    return null;
}

function almostRoot(num) {
    return Math.floor(Math.sqrt(num));
}
