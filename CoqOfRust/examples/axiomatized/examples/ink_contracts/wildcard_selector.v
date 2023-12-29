(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn decode_input<T>() -> Result<T, ()> {
    unimplemented!()
}
*)
Parameter decode_input : forall {T : Set}, M (core.result.Result.t T unit).

Module  WildcardSelector.
Section WildcardSelector.
  Inductive t : Set := Build.
End WildcardSelector.
End WildcardSelector.

Module  Impl_wildcard_selector_WildcardSelector_t.
Section Impl_wildcard_selector_WildcardSelector_t.
  Definition Self : Set := wildcard_selector.WildcardSelector.t.
  
  (*
      pub fn new() -> Self {
          Self {}
      }
  *)
  Parameter new : M Self.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn wildcard(&mut self) {
          let (_selector, _message) = decode_input::<([u8; 4], String)>().unwrap();
          println!("Wildcard selector: {:?}, message: {}", _selector, _message);
      }
  *)
  Parameter wildcard : (mut_ref Self) -> M unit.
  
  Global Instance AssociatedFunction_wildcard :
    Notations.DoubleColon Self "wildcard" := {
    Notations.double_colon := wildcard;
  }.
  
  (*
      pub fn wildcard_complement(&mut self, _message: String) {
          println!("Wildcard complement message: {}", _message);
      }
  *)
  Parameter wildcard_complement :
      (mut_ref Self) -> alloc.string.String.t -> M unit.
  
  Global Instance AssociatedFunction_wildcard_complement :
    Notations.DoubleColon Self "wildcard_complement" := {
    Notations.double_colon := wildcard_complement;
  }.
End Impl_wildcard_selector_WildcardSelector_t.
End Impl_wildcard_selector_WildcardSelector_t.