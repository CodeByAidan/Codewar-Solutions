// multiply=Function('a,b','return a*b')

// multiply=(...a)=>a.reduce((p,c)=>p*c,1)

// multiply=(...a)=>a.map(e=>x*=e,x=1).pop()

// multiply=(...a)=>eval(a.join`*`)

// multiply=(a,b,c=0)=>[...{*[Symbol.iterator](){while(b){--b;yield c+=a}}}].pop()

// multiply=f=(a,b,r=0)=>!b?r:f(a,--b,r+=a)

function multiply(a, b) {
  var num_a = `${a}`.split("").map(Number);
  var num_b = `${b}`.split("").map(Number);
  var num_arr = [];
  var t = 1;

  while (num_a.length > 0) {
    var num = [];
    var carry = 0;
    var c = num_a.pop();
    for (var i = num_b.length - 1; i >= 0; i--) {
      var y = c * num_b[i] + carry;
      num.push(y % 10);
      carry = Math.floor(y / 10);
    }
    if (carry > 0) {
      num.push(carry);
    }
    var a = +num.reverse().join("") * t;
    num_arr.push(a);
    t *= 10;
  }

  return num_arr.reduce((prev, curr) => prev + curr);
}
