(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Person";
    ty_params := [];
    fields :=
      [
        ("id", Ty.path "u32");
        ("name", Ty.path "alloc::string::String");
        ("phone", Ty.path "u64")
      ];
  } *)

Module Impl_core_hash_Hash_for_hash_Person.
  Definition Self : Ty.t := Ty.path "hash::Person".
  
  (*
  Hash
  *)
  Definition hash (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ __H ], [ self; state ] =>
      let* self := M.alloc self in
      let* state := M.alloc state in
      let* _ :=
        let* α0 :=
          M.get_trait_method
            "core::hash::Hash"
            (Ty.path "u32")
            []
            "hash"
            [ __H ] in
        let* α1 := M.read self in
        let* α2 := M.read state in
        let* α3 :=
          M.call_closure
            α0
            [ M.get_struct_record_field α1 "hash::Person" "id"; α2 ] in
        M.alloc α3 in
      let* _ :=
        let* α0 :=
          M.get_trait_method
            "core::hash::Hash"
            (Ty.path "alloc::string::String")
            []
            "hash"
            [ __H ] in
        let* α1 := M.read self in
        let* α2 := M.read state in
        let* α3 :=
          M.call_closure
            α0
            [ M.get_struct_record_field α1 "hash::Person" "name"; α2 ] in
        M.alloc α3 in
      let* α0 :=
        M.get_trait_method
          "core::hash::Hash"
          (Ty.path "u64")
          []
          "hash"
          [ __H ] in
      let* α1 := M.read self in
      let* α2 := M.read state in
      let* α3 :=
        M.call_closure
          α0
          [ M.get_struct_record_field α1 "hash::Person" "phone"; α2 ] in
      let* α0 := M.alloc α3 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::hash::Hash"
      (* Self *) (Ty.path "hash::Person")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("hash", InstanceField.Method hash) ].
End Impl_core_hash_Hash_for_hash_Person.

(*
fn calculate_hash<T: Hash>(t: &T) -> u64 {
    let mut s = DefaultHasher::new();
    t.hash(&mut s);
    s.finish()
}
*)
Definition calculate_hash (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ T ], [ t ] =>
    let* t := M.alloc t in
    let* s :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "std::hash::random::DefaultHasher")
          "new"
          [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::hash::Hash"
          T
          []
          "hash"
          [ Ty.path "std::hash::random::DefaultHasher" ] in
      let* α1 := M.read t in
      let* α2 := M.call_closure α0 [ α1; s ] in
      M.alloc α2 in
    let* α0 :=
      M.get_trait_method
        "core::hash::Hasher"
        (Ty.path "std::hash::random::DefaultHasher")
        []
        "finish"
        [] in
    let* α1 := M.call_closure α0 [ s ] in
    let* α0 := M.alloc α1 in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let person1 = Person {
        id: 5,
        name: "Janet".to_string(),
        phone: 555_666_7777,
    };
    let person2 = Person {
        id: 5,
        name: "Bob".to_string(),
        phone: 555_666_7777,
    };

    assert!(calculate_hash(&person1) != calculate_hash(&person2));
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* person1 :=
      let* α0 :=
        M.get_trait_method
          "alloc::string::ToString"
          (Ty.path "str")
          []
          "to_string"
          [] in
      let* α1 := M.read (mk_str "Janet") in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc
        (Value.StructRecord
          "hash::Person"
          [
            ("id", Value.Integer Integer.U32 5);
            ("name", α2);
            ("phone", Value.Integer Integer.U64 5556667777)
          ]) in
    let* person2 :=
      let* α0 :=
        M.get_trait_method
          "alloc::string::ToString"
          (Ty.path "str")
          []
          "to_string"
          [] in
      let* α1 := M.read (mk_str "Bob") in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc
        (Value.StructRecord
          "hash::Person"
          [
            ("id", Value.Integer Integer.U32 5);
            ("name", α2);
            ("phone", Value.Integer Integer.U64 5556667777)
          ]) in
    let* _ :=
      let* α0 :=
        M.get_function "hash::calculate_hash" [ Ty.path "hash::Person" ] in
      let* α1 := M.call_closure α0 [ person1 ] in
      let* α2 :=
        M.get_function "hash::calculate_hash" [ Ty.path "hash::Person" ] in
      let* α3 := M.call_closure α2 [ person2 ] in
      let* α4 := M.alloc (UnOp.Pure.not (BinOp.Pure.ne α1 α3)) in
      let* α5 := M.read (M.use α4) in
      if Value.is_true α5 then
        let* α0 := M.get_function "core::panicking::panic" [] in
        let* α1 :=
          M.read
            (mk_str
              "assertion failed: calculate_hash(&person1) != calculate_hash(&person2)") in
        let* α2 := M.call_closure α0 [ α1 ] in
        let* α3 := M.never_to_any α2 in
        M.alloc α3
      else
        M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.