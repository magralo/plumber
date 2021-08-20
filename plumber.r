
#* Determine if an integer is odd or even
#* @serializer text
#* @param int Integer to test for parity
#* @get /parity
function(int) {
  future({
    if (as.integer(int) %% 2 == 0) "even" else "odd"
  })
}



#* Determine if he either loves you or not (stop the daisy masasacre)
#* @serializer text
#* @get /lovemenot
function() {
  future({
    if (runif(1)>0.5) "(s)he loves you" else "nevermind, let her/him go"
  })
}
