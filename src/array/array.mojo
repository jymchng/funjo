from memory import stack_allocation
from utils.list import VariadicList

struct Array[T: AnyType, N: Int]:
   alias size: Int = N
   alias size_error_msg: StringLiteral = "Initial `size` of array must be less than 32"
   alias unequal_sizes_error_msg: StringLiteral = "`size` of `iterable` is not equal to the `size` of array"

   var storage: Pointer[T]

   fn __init__(inout self, *elements: T) raises:
      constrained[N <= 32, Array[T, N].size_error_msg]()
      let element_varlist = VariadicList(elements)
      if N != element_varlist.__len__():
         raise Error(self.unequal_sizes_error_msg)
      self.storage = stack_allocation[N, T]()
      for i in range(N):
         self.storage.store(i, element_varlist.__getitem__(i))

   fn __init__[*Ts: AnyType](inout self, owned elements: ListLiteral[Ts]) raises:
      constrained[N <= 32, Array[T, N].size_error_msg]()
      if N != elements.__len__():
         raise Error(self.unequal_sizes_error_msg)
      self.storage = stack_allocation[N, T]()
      let src: Pointer[T] = Pointer.address_of(elements).bitcast[T]()
      for i in range(len(elements)):
         self.storage.store(i, src.load(i))

   fn __getitem__(self, idx: Int) raises -> T :
      if idx > self.size:
         raise Error("Out of bounds")
      return self.storage[idx]

   fn __setitem__(self, idx: Int, value: T) raises:
      if idx > self.size:
         raise Error("Out of bounds")
      self.storage.store(idx, value)


