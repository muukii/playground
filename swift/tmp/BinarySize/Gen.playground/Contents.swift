
for i in 0..<1000 {
  
  print("""
    class Box_\(i) {
      let a: String
      let b: Int
      let c: Double
      
      init(a: String, b: Int, c: Double) {
        self.a = a
        self.b = b
        self.c = c
      }
    }
    """)
  
}
