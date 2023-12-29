(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  AccountId.
Section AccountId.
  Record t : Set := {
    x0 : u128.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>));
  }.
End AccountId.
End AccountId.

Module  Impl_core_default_Default_for_call_builder_AccountId_t.
Section Impl_core_default_Default_for_call_builder_AccountId_t.
  Definition Self : Set := call_builder.AccountId.t.
  
  (*
  Default
  *)
  Definition default : M call_builder.AccountId.t :=
    let* α0 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    M.pure (call_builder.AccountId.Build_t α0).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_call_builder_AccountId_t.
End Impl_core_default_Default_for_call_builder_AccountId_t.

Module  Impl_core_clone_Clone_for_call_builder_AccountId_t.
Section Impl_core_clone_Clone_for_call_builder_AccountId_t.
  Definition Self : Set := call_builder.AccountId.t.
  
  (*
  Clone
  *)
  Definition clone (self : ref Self) : M call_builder.AccountId.t :=
    let* self := M.alloc self in
    let _ : unit := tt in
    let* α0 : ref call_builder.AccountId.t := M.read self in
    M.read (deref α0).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_call_builder_AccountId_t.
End Impl_core_clone_Clone_for_call_builder_AccountId_t.

Module  Impl_core_marker_Copy_for_call_builder_AccountId_t.
Section Impl_core_marker_Copy_for_call_builder_AccountId_t.
  Definition Self : Set := call_builder.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_call_builder_AccountId_t.
End Impl_core_marker_Copy_for_call_builder_AccountId_t.

Ltac Balance := exact u128.t.

Ltac Hash := exact (array u8.t).

Module LangError.
  Inductive t : Set :=
  | CouldNotReadInput
  | AnotherError.
End LangError.

Module  Selector.
Section Selector.
  Inductive t : Set := Build.
End Selector.
End Selector.

Module  Impl_call_builder_Selector_t.
Section Impl_call_builder_Selector_t.
  Definition Self : Set := call_builder.Selector.t.
  
  (*
      fn new(bytes: [u8; 4]) -> Self {
          unimplemented!()
      }
  *)
  Definition new (bytes : array u8.t) : M Self :=
    let* bytes := M.alloc bytes in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
End Impl_call_builder_Selector_t.
End Impl_call_builder_Selector_t.

Module  CallBuilderTest.
Section CallBuilderTest.
  Inductive t : Set := Build.
End CallBuilderTest.
End CallBuilderTest.

Module  Impl_core_default_Default_for_call_builder_CallBuilderTest_t.
Section Impl_core_default_Default_for_call_builder_CallBuilderTest_t.
  Definition Self : Set := call_builder.CallBuilderTest.t.
  
  (*
  Default
  *)
  Definition default : M call_builder.CallBuilderTest.t :=
    M.pure call_builder.CallBuilderTest.Build.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_call_builder_CallBuilderTest_t.
End Impl_core_default_Default_for_call_builder_CallBuilderTest_t.

Module  Impl_call_builder_CallBuilderTest_t.
Section Impl_call_builder_CallBuilderTest_t.
  Definition Self : Set := call_builder.CallBuilderTest.t.
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Definition new : M Self :=
    M.call
      (core.default.Default.default
        (Self := call_builder.CallBuilderTest.t)
        (Trait := ltac:(refine _))).
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn call(&mut self, address: AccountId, selector: [u8; 4]) -> Option<LangError> {
          // let result = build_call::<DefaultEnvironment>()
          //     .call(address)
          //     .exec_input(ExecutionInput::new(Selector::new(selector)))
          //     .returns::<()>()
          //     .try_invoke()
          //     .expect("Error from the Contracts pallet.");
          let result: Result<(), LangError> = todo!();
  
          match result {
              Ok(_) => None,
              Err(e @ LangError::CouldNotReadInput) => Some(e),
              Err(_) => {
                  unimplemented!("No other `LangError` variants exist at the moment.")
              }
          }
      }
  *)
  Definition call
      (self : mut_ref Self)
      (address : call_builder.AccountId.t)
      (selector : array u8.t)
      : M (core.option.Option.t call_builder.LangError.t) :=
    let* self := M.alloc self in
    let* address := M.alloc address in
    let* selector := M.alloc selector in
    let* result : M.Val (core.result.Result.t unit call_builder.LangError.t) :=
      let* α0 : ref str.t := M.read (mk_str "not yet implemented") in
      let* α1 : never.t := M.call (core.panicking.panic α0) in
      let* α2 : core.result.Result.t unit call_builder.LangError.t :=
        never_to_any α1 in
      M.alloc α2 in
    let* α0 : core.result.Result.t unit call_builder.LangError.t :=
      M.read result in
    let* α0 : M.Val (core.option.Option.t call_builder.LangError.t) :=
      match α0 with
      | core.result.Result.Ok _ => M.alloc core.option.Option.None
      |
          core.result.Result.Err (call_builder.LangError.CouldNotReadInput as e)
          =>
        let* e := M.alloc e in
        let* α0 : call_builder.LangError.t := M.read e in
        M.alloc (core.option.Option.Some α0)
      | core.result.Result.Err _ =>
        let* α0 : ref str.t :=
          M.read
            (mk_str
              "not implemented: No other `LangError` variants exist at the moment.") in
        let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
        let* α3 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α2) in
        let* α4 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ ] in
        let* α5 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
          M.alloc (borrow α4) in
        let* α6 : ref (slice core.fmt.rt.Argument.t) :=
          M.read (pointer_coercion "Unsize" α5) in
        let* α7 : core.fmt.Arguments.t :=
          M.call (core.fmt.Arguments.t::["new_v1"] α3 α6) in
        let* α8 : never.t := M.call (core.panicking.panic_fmt α7) in
        let* α9 : core.option.Option.t call_builder.LangError.t :=
          never_to_any α8 in
        M.alloc α9
      end in
    M.read α0.
  
  Global Instance AssociatedFunction_call :
    Notations.DoubleColon Self "call" := {
    Notations.double_colon := call;
  }.
  
  (*
      pub fn invoke(&mut self, address: AccountId, selector: [u8; 4]) {
          // use ink::env::call::build_call;
  
          // build_call::<DefaultEnvironment>()
          //     .call(address)
          //     .exec_input(ExecutionInput::new(Selector::new(selector)))
          //     .returns::<()>()
          //     .invoke()
      }
  *)
  Definition invoke
      (self : mut_ref Self)
      (address : call_builder.AccountId.t)
      (selector : array u8.t)
      : M unit :=
    let* self := M.alloc self in
    let* address := M.alloc address in
    let* selector := M.alloc selector in
    M.pure tt.
  
  Global Instance AssociatedFunction_invoke :
    Notations.DoubleColon Self "invoke" := {
    Notations.double_colon := invoke;
  }.
  
  (*
      pub fn call_instantiate(
          &mut self,
          code_hash: Hash,
          selector: [u8; 4],
          init_value: bool,
      ) -> Option<LangError> {
          // let mut params = ConstructorsReturnValueRef::new(init_value)
          //     .code_hash(code_hash)
          //     .gas_limit(0)
          //     .endowment(0)
          //     .salt_bytes(&[0xDE, 0xAD, 0xBE, 0xEF])
          //     .params();
  
          // params.update_selector(Selector::new(selector));
  
          // let result = params
          //     .try_instantiate()
          //     .expect("Error from the Contracts pallet.");
  
          // match result {
          //     Ok(_) => None,
          //     Err(e @ LangError::CouldNotReadInput) => Some(e),
          //     Err(_) => {
          //         unimplemented!("No other `LangError` variants exist at the moment.")
          //     }
          // }
          None
      }
  *)
  Definition call_instantiate
      (self : mut_ref Self)
      (code_hash : ltac:(call_builder.Hash))
      (selector : array u8.t)
      (init_value : bool.t)
      : M (core.option.Option.t call_builder.LangError.t) :=
    let* self := M.alloc self in
    let* code_hash := M.alloc code_hash in
    let* selector := M.alloc selector in
    let* init_value := M.alloc init_value in
    M.pure core.option.Option.None.
  
  Global Instance AssociatedFunction_call_instantiate :
    Notations.DoubleColon Self "call_instantiate" := {
    Notations.double_colon := call_instantiate;
  }.
  
  (*
      pub fn call_instantiate_fallible(
          &mut self,
          code_hash: Hash,
          selector: [u8; 4],
          init_value: bool,
          // ) -> Option<Result<Result<AccountId, constructors_return_value::ConstructorError>, LangError>>
      ) -> Option<()> {
          // let mut params = ConstructorsReturnValueRef::try_new(init_value)
          //     .code_hash(code_hash)
          //     .gas_limit(0)
          //     .endowment(0)
          //     .salt_bytes(&[0xDE, 0xAD, 0xBE, 0xEF])
          //     .params();
  
          // params.update_selector(Selector::new(selector));
  
          // let lang_result = params
          //     .try_instantiate()
          //     .expect("Error from the Contracts pallet.");
  
          // Some(lang_result.map(|contract_result| {
          //     contract_result.map(|inner| ink::ToAccountId::to_account_id(&inner))
          // }))
          None
      }
  *)
  Definition call_instantiate_fallible
      (self : mut_ref Self)
      (code_hash : ltac:(call_builder.Hash))
      (selector : array u8.t)
      (init_value : bool.t)
      : M (core.option.Option.t unit) :=
    let* self := M.alloc self in
    let* code_hash := M.alloc code_hash in
    let* selector := M.alloc selector in
    let* init_value := M.alloc init_value in
    M.pure core.option.Option.None.
  
  Global Instance AssociatedFunction_call_instantiate_fallible :
    Notations.DoubleColon Self "call_instantiate_fallible" := {
    Notations.double_colon := call_instantiate_fallible;
  }.
End Impl_call_builder_CallBuilderTest_t.
End Impl_call_builder_CallBuilderTest_t.