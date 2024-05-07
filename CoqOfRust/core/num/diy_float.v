(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module num.
  Module diy_float.
    (* StructRecord
      {
        name := "Fp";
        ty_params := [];
        fields := [ ("f", Ty.path "u64"); ("e", Ty.path "i16") ];
      } *)
    
    Module Impl_core_marker_Copy_for_core_num_diy_float_Fp.
      Definition Self : Ty.t := Ty.path "core::num::diy_float::Fp".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::Copy"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Copy_for_core_num_diy_float_Fp.
    
    Module Impl_core_clone_Clone_for_core_num_diy_float_Fp.
      Definition Self : Ty.t := Ty.path "core::num::diy_float::Fp".
      
      (* Clone *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.match_operator (|
                Value.DeclaredButUndefined,
                [
                  fun γ =>
                    ltac:(M.monadic
                      (M.match_operator (|
                        Value.DeclaredButUndefined,
                        [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
                      |)))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_core_num_diy_float_Fp.
    
    Module Impl_core_fmt_Debug_for_core_num_diy_float_Fp.
      Definition Self : Ty.t := Ty.path "core::num::diy_float::Fp".
      
      (* Debug *)
      Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; f ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let f := M.alloc (| f |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "core::fmt::Formatter",
                "debug_struct_field2_finish",
                []
              |),
              [
                M.read (| f |);
                M.read (| Value.String "Fp" |);
                M.read (| Value.String "f" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::num::diy_float::Fp",
                    "f"
                  |));
                M.read (| Value.String "e" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.alloc (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "core::num::diy_float::Fp",
                      "e"
                    |)
                  |))
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::fmt::Debug"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
    End Impl_core_fmt_Debug_for_core_num_diy_float_Fp.
    
    Module Impl_core_num_diy_float_Fp.
      Definition Self : Ty.t := Ty.path "core::num::diy_float::Fp".
      
      (*
          pub fn mul(&self, other: &Fp) -> Fp {
              const MASK: u64 = 0xffffffff;
              let a = self.f >> 32;
              let b = self.f & MASK;
              let c = other.f >> 32;
              let d = other.f & MASK;
              let ac = a * c;
              let bc = b * c;
              let ad = a * d;
              let bd = b * d;
              let tmp = (bd >> 32) + (ad & MASK) + (bc & MASK) + (1 << 31) /* round */;
              let f = ac + (ad >> 32) + (bc >> 32) + (tmp >> 32);
              let e = self.e + other.e + 64;
              Fp { f, e }
          }
      *)
      Definition mul (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.read (|
              let a :=
                M.alloc (|
                  BinOp.Panic.shr (|
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::num::diy_float::Fp",
                        "f"
                      |)
                    |),
                    Value.Integer 32
                  |)
                |) in
              let b :=
                M.alloc (|
                  BinOp.Pure.bit_and
                    (M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::num::diy_float::Fp",
                        "f"
                      |)
                    |))
                    (M.read (| M.get_constant (| "core::num::diy_float::mul::MASK" |) |))
                |) in
              let c :=
                M.alloc (|
                  BinOp.Panic.shr (|
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| other |),
                        "core::num::diy_float::Fp",
                        "f"
                      |)
                    |),
                    Value.Integer 32
                  |)
                |) in
              let d :=
                M.alloc (|
                  BinOp.Pure.bit_and
                    (M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| other |),
                        "core::num::diy_float::Fp",
                        "f"
                      |)
                    |))
                    (M.read (| M.get_constant (| "core::num::diy_float::mul::MASK" |) |))
                |) in
              let ac :=
                M.alloc (| BinOp.Panic.mul (| Integer.U64, M.read (| a |), M.read (| c |) |) |) in
              let bc :=
                M.alloc (| BinOp.Panic.mul (| Integer.U64, M.read (| b |), M.read (| c |) |) |) in
              let ad :=
                M.alloc (| BinOp.Panic.mul (| Integer.U64, M.read (| a |), M.read (| d |) |) |) in
              let bd :=
                M.alloc (| BinOp.Panic.mul (| Integer.U64, M.read (| b |), M.read (| d |) |) |) in
              let tmp :=
                M.alloc (|
                  BinOp.Panic.add (|
                    Integer.U64,
                    BinOp.Panic.add (|
                      Integer.U64,
                      BinOp.Panic.add (|
                        Integer.U64,
                        BinOp.Panic.shr (| M.read (| bd |), Value.Integer 32 |),
                        BinOp.Pure.bit_and
                          (M.read (| ad |))
                          (M.read (| M.get_constant (| "core::num::diy_float::mul::MASK" |) |))
                      |),
                      BinOp.Pure.bit_and
                        (M.read (| bc |))
                        (M.read (| M.get_constant (| "core::num::diy_float::mul::MASK" |) |))
                    |),
                    BinOp.Panic.shl (| Value.Integer 1, Value.Integer 31 |)
                  |)
                |) in
              let f :=
                M.alloc (|
                  BinOp.Panic.add (|
                    Integer.U64,
                    BinOp.Panic.add (|
                      Integer.U64,
                      BinOp.Panic.add (|
                        Integer.U64,
                        M.read (| ac |),
                        BinOp.Panic.shr (| M.read (| ad |), Value.Integer 32 |)
                      |),
                      BinOp.Panic.shr (| M.read (| bc |), Value.Integer 32 |)
                    |),
                    BinOp.Panic.shr (| M.read (| tmp |), Value.Integer 32 |)
                  |)
                |) in
              let e :=
                M.alloc (|
                  BinOp.Panic.add (|
                    Integer.I16,
                    BinOp.Panic.add (|
                      Integer.I16,
                      M.read (|
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "core::num::diy_float::Fp",
                          "e"
                        |)
                      |),
                      M.read (|
                        M.SubPointer.get_struct_record_field (|
                          M.read (| other |),
                          "core::num::diy_float::Fp",
                          "e"
                        |)
                      |)
                    |),
                    Value.Integer 64
                  |)
                |) in
              M.alloc (|
                Value.StructRecord
                  "core::num::diy_float::Fp"
                  [ ("f", M.read (| f |)); ("e", M.read (| e |)) ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_mul : M.IsAssociatedFunction Self "mul" mul.
      
      (*
          pub fn normalize(&self) -> Fp {
              let mut f = self.f;
              let mut e = self.e;
              if f >> (64 - 32) == 0 {
                  f <<= 32;
                  e -= 32;
              }
              if f >> (64 - 16) == 0 {
                  f <<= 16;
                  e -= 16;
              }
              if f >> (64 - 8) == 0 {
                  f <<= 8;
                  e -= 8;
              }
              if f >> (64 - 4) == 0 {
                  f <<= 4;
                  e -= 4;
              }
              if f >> (64 - 2) == 0 {
                  f <<= 2;
                  e -= 2;
              }
              if f >> (64 - 1) == 0 {
                  f <<= 1;
                  e -= 1;
              }
              debug_assert!(f >= (1 << 63));
              Fp { f, e }
          }
      *)
      Definition normalize (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              let f :=
                M.copy (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::num::diy_float::Fp",
                    "f"
                  |)
                |) in
              let e :=
                M.copy (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::num::diy_float::Fp",
                    "e"
                  |)
                |) in
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              BinOp.Pure.eq
                                (BinOp.Panic.shr (|
                                  M.read (| f |),
                                  BinOp.Panic.sub (|
                                    Integer.I32,
                                    Value.Integer 64,
                                    Value.Integer 32
                                  |)
                                |))
                                (Value.Integer 0)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let _ :=
                          let β := f in
                          M.write (| β, BinOp.Panic.shl (| M.read (| β |), Value.Integer 32 |) |) in
                        let _ :=
                          let β := e in
                          M.write (|
                            β,
                            BinOp.Panic.sub (| Integer.I16, M.read (| β |), Value.Integer 32 |)
                          |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              BinOp.Pure.eq
                                (BinOp.Panic.shr (|
                                  M.read (| f |),
                                  BinOp.Panic.sub (|
                                    Integer.I32,
                                    Value.Integer 64,
                                    Value.Integer 16
                                  |)
                                |))
                                (Value.Integer 0)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let _ :=
                          let β := f in
                          M.write (| β, BinOp.Panic.shl (| M.read (| β |), Value.Integer 16 |) |) in
                        let _ :=
                          let β := e in
                          M.write (|
                            β,
                            BinOp.Panic.sub (| Integer.I16, M.read (| β |), Value.Integer 16 |)
                          |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              BinOp.Pure.eq
                                (BinOp.Panic.shr (|
                                  M.read (| f |),
                                  BinOp.Panic.sub (|
                                    Integer.I32,
                                    Value.Integer 64,
                                    Value.Integer 8
                                  |)
                                |))
                                (Value.Integer 0)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let _ :=
                          let β := f in
                          M.write (| β, BinOp.Panic.shl (| M.read (| β |), Value.Integer 8 |) |) in
                        let _ :=
                          let β := e in
                          M.write (|
                            β,
                            BinOp.Panic.sub (| Integer.I16, M.read (| β |), Value.Integer 8 |)
                          |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              BinOp.Pure.eq
                                (BinOp.Panic.shr (|
                                  M.read (| f |),
                                  BinOp.Panic.sub (|
                                    Integer.I32,
                                    Value.Integer 64,
                                    Value.Integer 4
                                  |)
                                |))
                                (Value.Integer 0)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let _ :=
                          let β := f in
                          M.write (| β, BinOp.Panic.shl (| M.read (| β |), Value.Integer 4 |) |) in
                        let _ :=
                          let β := e in
                          M.write (|
                            β,
                            BinOp.Panic.sub (| Integer.I16, M.read (| β |), Value.Integer 4 |)
                          |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              BinOp.Pure.eq
                                (BinOp.Panic.shr (|
                                  M.read (| f |),
                                  BinOp.Panic.sub (|
                                    Integer.I32,
                                    Value.Integer 64,
                                    Value.Integer 2
                                  |)
                                |))
                                (Value.Integer 0)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let _ :=
                          let β := f in
                          M.write (| β, BinOp.Panic.shl (| M.read (| β |), Value.Integer 2 |) |) in
                        let _ :=
                          let β := e in
                          M.write (|
                            β,
                            BinOp.Panic.sub (| Integer.I16, M.read (| β |), Value.Integer 2 |)
                          |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              BinOp.Pure.eq
                                (BinOp.Panic.shr (|
                                  M.read (| f |),
                                  BinOp.Panic.sub (|
                                    Integer.I32,
                                    Value.Integer 64,
                                    Value.Integer 1
                                  |)
                                |))
                                (Value.Integer 0)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let _ :=
                          let β := f in
                          M.write (| β, BinOp.Panic.shl (| M.read (| β |), Value.Integer 1 |) |) in
                        let _ :=
                          let β := e in
                          M.write (|
                            β,
                            BinOp.Panic.sub (| Integer.I16, M.read (| β |), Value.Integer 1 |)
                          |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ := M.use (M.alloc (| Value.Bool true |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let _ :=
                          M.match_operator (|
                            M.alloc (| Value.Tuple [] |),
                            [
                              fun γ =>
                                ltac:(M.monadic
                                  (let γ :=
                                    M.use
                                      (M.alloc (|
                                        UnOp.Pure.not
                                          (BinOp.Pure.ge
                                            (M.read (| f |))
                                            (BinOp.Panic.shl (|
                                              Value.Integer 1,
                                              Value.Integer 63
                                            |)))
                                      |)) in
                                  let _ :=
                                    M.is_constant_or_break_match (|
                                      M.read (| γ |),
                                      Value.Bool true
                                    |) in
                                  M.alloc (|
                                    M.never_to_any (|
                                      M.call_closure (|
                                        M.get_function (| "core::panicking::panic", [] |),
                                        [
                                          M.read (|
                                            Value.String "assertion failed: f >= (1 << 63)"
                                          |)
                                        ]
                                      |)
                                    |)
                                  |)));
                              fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                            ]
                          |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              M.alloc (|
                Value.StructRecord
                  "core::num::diy_float::Fp"
                  [ ("f", M.read (| f |)); ("e", M.read (| e |)) ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_normalize : M.IsAssociatedFunction Self "normalize" normalize.
      
      (*
          pub fn normalize_to(&self, e: i16) -> Fp {
              let edelta = self.e - e;
              assert!(edelta >= 0);
              let edelta = edelta as usize;
              assert_eq!(self.f << edelta >> edelta, self.f);
              Fp { f: self.f << edelta, e }
          }
      *)
      Definition normalize_to (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; e ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let e := M.alloc (| e |) in
            M.read (|
              let edelta :=
                M.alloc (|
                  BinOp.Panic.sub (|
                    Integer.I16,
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::num::diy_float::Fp",
                        "e"
                      |)
                    |),
                    M.read (| e |)
                  |)
                |) in
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              UnOp.Pure.not (BinOp.Pure.ge (M.read (| edelta |)) (Value.Integer 0))
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        M.alloc (|
                          M.never_to_any (|
                            M.call_closure (|
                              M.get_function (| "core::panicking::panic", [] |),
                              [ M.read (| Value.String "assertion failed: edelta >= 0" |) ]
                            |)
                          |)
                        |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              let edelta := M.alloc (| M.rust_cast (M.read (| edelta |)) |) in
              let _ :=
                M.match_operator (|
                  M.alloc (|
                    Value.Tuple
                      [
                        M.alloc (|
                          BinOp.Panic.shr (|
                            BinOp.Panic.shl (|
                              M.read (|
                                M.SubPointer.get_struct_record_field (|
                                  M.read (| self |),
                                  "core::num::diy_float::Fp",
                                  "f"
                                |)
                              |),
                              M.read (| edelta |)
                            |),
                            M.read (| edelta |)
                          |)
                        |);
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "core::num::diy_float::Fp",
                          "f"
                        |)
                      ]
                  |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                        let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                        let left_val := M.copy (| γ0_0 |) in
                        let right_val := M.copy (| γ0_1 |) in
                        M.match_operator (|
                          M.alloc (| Value.Tuple [] |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let γ :=
                                  M.use
                                    (M.alloc (|
                                      UnOp.Pure.not
                                        (BinOp.Pure.eq
                                          (M.read (| M.read (| left_val |) |))
                                          (M.read (| M.read (| right_val |) |)))
                                    |)) in
                                let _ :=
                                  M.is_constant_or_break_match (|
                                    M.read (| γ |),
                                    Value.Bool true
                                  |) in
                                M.alloc (|
                                  M.never_to_any (|
                                    M.read (|
                                      let kind :=
                                        M.alloc (|
                                          Value.StructTuple "core::panicking::AssertKind::Eq" []
                                        |) in
                                      M.alloc (|
                                        M.call_closure (|
                                          M.get_function (|
                                            "core::panicking::assert_failed",
                                            [ Ty.path "u64"; Ty.path "u64" ]
                                          |),
                                          [
                                            M.read (| kind |);
                                            M.read (| left_val |);
                                            M.read (| right_val |);
                                            Value.StructTuple "core::option::Option::None" []
                                          ]
                                        |)
                                      |)
                                    |)
                                  |)
                                |)));
                            fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                          ]
                        |)))
                  ]
                |) in
              M.alloc (|
                Value.StructRecord
                  "core::num::diy_float::Fp"
                  [
                    ("f",
                      BinOp.Panic.shl (|
                        M.read (|
                          M.SubPointer.get_struct_record_field (|
                            M.read (| self |),
                            "core::num::diy_float::Fp",
                            "f"
                          |)
                        |),
                        M.read (| edelta |)
                      |));
                    ("e", M.read (| e |))
                  ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_normalize_to :
        M.IsAssociatedFunction Self "normalize_to" normalize_to.
    End Impl_core_num_diy_float_Fp.
  End diy_float.
End num.