
console.log('hello');

interface Model {
  name: string
}

const obj: Model = JSON.parse(
  // '{ "name" : "hoge" }'
  '{  }'
  // '{ "name" : "hoge" }'
)

const r = obj.name

console.log(r)

const hoge: string | undefined = "aaa"
