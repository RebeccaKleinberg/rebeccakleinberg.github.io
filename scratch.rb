# p = Proc.new { |x| puts x * 10 } # Creates a new Proc object called p that with the
#                                  # code block supplied between the {curly braces}.

# [1,2,3].each(&p)                 # Operated the .each method on the [1,2,3] array,
#                                  # passing (&p) as the arguement. In this case, "p"
#                                  # is the variable and "&" tells ruby to turn "p"
#                                  # instance of a the proc into a block


# def lambda_ex
#   lam = lambda { return }
#   lam.call
#   puts "Rebecca is cool"
# end
# lambda_ex
# # returns "Rebecca is cool" because
# # lambda triggers a return from the
# # body of the lambda

# def proc_ex
#   prc = Proc.new { return }
#   prc.call
#   puts "Rebecca is cool"
# end
# proc_ex
# # returns nothing because proc triggers
# # a return proc_ex method.

lam = lambda { |x| p x+1 }
lam.call(1)
# returns 2
lam.call(1,2)
# throws an ArgumentError

prc = Proc.new { |x| p x+1 }
prc.call(1)
# returns 2
prc.call(1,2)
# returns 2 from the first arguement
# passed, ignores all others


