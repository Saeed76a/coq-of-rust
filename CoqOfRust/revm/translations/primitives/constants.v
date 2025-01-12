(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module constants.
  Definition value_MAX_CODE_SIZE : Value.t :=
    M.run ltac:(M.monadic (M.alloc (| Value.Integer 24576 |))).
  
  Definition value_BLOCK_HASH_HISTORY : Value.t :=
    M.run ltac:(M.monadic (M.alloc (| Value.Integer 256 |))).
  
  Definition value_BLOCKHASH_SERVE_WINDOW : Value.t :=
    M.run ltac:(M.monadic (M.alloc (| Value.Integer 8192 |))).
  
  Definition value_BLOCKHASH_STORAGE_ADDRESS : Value.t :=
    M.run
      ltac:(M.monadic
        (M.alloc (|
          M.call_closure (|
            M.get_associated_function (|
              Ty.path "alloy_primitives::bits::address::Address",
              "new",
              []
            |),
            [
              M.read (|
                M.get_constant (| "revm_primitives::constants::BLOCKHASH_STORAGE_ADDRESS::RES" |)
              |)
            ]
          |)
        |))).
  
  Definition value_MAX_INITCODE_SIZE : Value.t :=
    M.run
      ltac:(M.monadic
        (M.alloc (|
          BinOp.Wrap.mul
            Integer.Usize
            (Value.Integer 2)
            (M.read (| M.get_constant (| "revm_primitives::constants::MAX_CODE_SIZE" |) |))
        |))).
  
  Definition value_PRECOMPILE3 : Value.t :=
    M.run
      ltac:(M.monadic
        (M.alloc (|
          M.call_closure (|
            M.get_associated_function (|
              Ty.path "alloy_primitives::bits::address::Address",
              "new",
              []
            |),
            [
              Value.Array
                [
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 0;
                  Value.Integer 3
                ]
            ]
          |)
        |))).
  
  Definition value_GAS_PER_BLOB : Value.t :=
    M.run ltac:(M.monadic (M.alloc (| BinOp.Wrap.shl (Value.Integer 1) (Value.Integer 17) |))).
  
  Definition value_TARGET_BLOB_NUMBER_PER_BLOCK : Value.t :=
    M.run ltac:(M.monadic (M.alloc (| Value.Integer 3 |))).
  
  Definition value_MAX_BLOB_NUMBER_PER_BLOCK : Value.t :=
    M.run
      ltac:(M.monadic
        (M.alloc (|
          BinOp.Wrap.mul
            Integer.U64
            (Value.Integer 2)
            (M.read (|
              M.get_constant (| "revm_primitives::constants::TARGET_BLOB_NUMBER_PER_BLOCK" |)
            |))
        |))).
  
  Definition value_MAX_BLOB_GAS_PER_BLOCK : Value.t :=
    M.run
      ltac:(M.monadic
        (M.alloc (|
          BinOp.Wrap.mul
            Integer.U64
            (M.read (|
              M.get_constant (| "revm_primitives::constants::MAX_BLOB_NUMBER_PER_BLOCK" |)
            |))
            (M.read (| M.get_constant (| "revm_primitives::constants::GAS_PER_BLOB" |) |))
        |))).
  
  Definition value_TARGET_BLOB_GAS_PER_BLOCK : Value.t :=
    M.run
      ltac:(M.monadic
        (M.alloc (|
          BinOp.Wrap.mul
            Integer.U64
            (M.read (|
              M.get_constant (| "revm_primitives::constants::TARGET_BLOB_NUMBER_PER_BLOCK" |)
            |))
            (M.read (| M.get_constant (| "revm_primitives::constants::GAS_PER_BLOB" |) |))
        |))).
  
  Definition value_MIN_BLOB_GASPRICE : Value.t :=
    M.run ltac:(M.monadic (M.alloc (| Value.Integer 1 |))).
  
  Definition value_BLOB_GASPRICE_UPDATE_FRACTION : Value.t :=
    M.run ltac:(M.monadic (M.alloc (| Value.Integer 3338477 |))).
  
  Definition value_VERSIONED_HASH_VERSION_KZG : Value.t :=
    M.run ltac:(M.monadic (M.alloc (| Value.Integer 1 |))).
End constants.
