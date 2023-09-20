import testing
from array import Array

fn expect_exception(fn_name: StringLiteral):
    testing.assert_true(False, "Exception did NOT occur in " + fn_name)

fn expect_no_exception(fn_name: StringLiteral):
    testing.assert_true(False, "Exception did occur in " + fn_name)

fn test_array_can_be_init() raises:
    let array: Array[Int, 3] = [1, 2, 3]
    let t1 = testing.assert_true(array[0] == 1, "test_array_can_be_init::t1 failed")
    let t2 = testing.assert_true(array[1] == 2, "test_array_can_be_init::t2 failed")
    let t3 = testing.assert_true(array[2] == 3, "test_array_can_be_init::t3 failed")

fn test_array_can_be_init2() raises:
    let array: Array[Int, 3] = Array[Int, 3](1, 2, 3)
    let t1 = testing.assert_true(array[0] == 1, "test_array_can_be_init2::t1 failed")
    let t2 = testing.assert_true(array[1] == 2, "test_array_can_be_init2::t2 failed")
    let t3 = testing.assert_true(array[2] == 3, "test_array_can_be_init2::t3 failed")

fn test_array_can_be_init_string() raises:
    let array: Array[StringLiteral, 3] = ["hey", "hello", "world"]
    let t1 = testing.assert_true(array[0] == "hey", "test_array_can_be_init_string::t1 failed")
    let t2 = testing.assert_true(array[1] == "hello", "test_array_can_be_init_string::t2 failed")
    let t3 = testing.assert_true(array[2] == "world", "test_array_can_be_init_string::t3 failed")

fn test_array_out_of_bounds_get() raises:
    let array: Array[Int, 3] = [1, 2, 3]
    try:
        let v: Int = array[5]
        expect_exception("test_array_out_of_bounds_get")
    except:
        pass

fn test_array_out_of_bounds_set() raises:
    let array: Array[Int, 3] = [1, 2, 3]
    try:
        array[5] = 99
        expect_exception("test_array_out_of_bounds_set")
    except:
        pass

fn test_array_get() raises:
    let array: Array[Int, 3] = [1, 2, 3]
    try:
        let v: Int = array[0]
    except:
        expect_no_exception("test_array_get")

fn test_array_set() raises:
    let array: Array[Int, 3] = [1, 2, 3]
    try:
        array[0] = 99
    except:
        expect_no_exception("test_array_set")

fn main() raises:
    print("Tests Results (if any): ")
    test_array_can_be_init()
    test_array_can_be_init2()
    test_array_can_be_init_string()
    test_array_out_of_bounds_get()
    test_array_out_of_bounds_set()
    test_array_get()
    test_array_set()
    print("Tests Completed!")
