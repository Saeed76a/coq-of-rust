(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Mapping.
Section Mapping.
  Context (K V : Set).
  
  Record t : Set := {
    _key : core.marker.PhantomData.t K;
    _value : core.marker.PhantomData.t V;
  }.
  
  Global Instance Get__key : Notations.Dot "_key" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(_key)) (fun β α => Some (α <| _key := β |>));
  }.
  Global Instance Get_AF__key : Notations.DoubleColon t "_key" := {
    Notations.double_colon (α : M.Val t) := α.["_key"];
  }.
  Global Instance Get__value : Notations.Dot "_value" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(_value))
        (fun β α => Some (α <| _value := β |>));
  }.
  Global Instance Get_AF__value : Notations.DoubleColon t "_value" := {
    Notations.double_colon (α : M.Val t) := α.["_value"];
  }.
End Mapping.
End Mapping.

Module  Impl_core_default_Default_for_mapping_integration_tests_Mapping_t_K_V.
Section Impl_core_default_Default_for_mapping_integration_tests_Mapping_t_K_V.
  Context {K V : Set}.
  
  Context
    {ℋ_0 : core.default.Default.Trait K}
    {ℋ_1 : core.default.Default.Trait V}.
  
  Definition Self : Set := mapping_integration_tests.Mapping.t K V.
  
  (*
  Default
  *)
  Parameter default : M (mapping_integration_tests.Mapping.t K V).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_mapping_integration_tests_Mapping_t_K_V.
End Impl_core_default_Default_for_mapping_integration_tests_Mapping_t_K_V.

Module  Impl_mapping_integration_tests_Mapping_t_K_V.
Section Impl_mapping_integration_tests_Mapping_t_K_V.
  Context {K V : Set}.
  
  Definition Self : Set := mapping_integration_tests.Mapping.t K V.
  
  (*
      fn contains(&self, _key: &K) -> bool {
          unimplemented!()
      }
  *)
  Parameter contains : (ref Self) -> (ref K) -> M bool.t.
  
  Global Instance AssociatedFunction_contains :
    Notations.DoubleColon Self "contains" := {
    Notations.double_colon := contains;
  }.
  
  (*
      fn get(&self, _key: &K) -> Option<V> {
          unimplemented!()
      }
  *)
  Parameter get : (ref Self) -> (ref K) -> M (core.option.Option.t V).
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
  
  (*
      fn insert(&mut self, _key: K, _value: V) -> Option<u32> {
          unimplemented!()
      }
  *)
  Parameter insert : (mut_ref Self) -> K -> V -> M (core.option.Option.t u32.t).
  
  Global Instance AssociatedFunction_insert :
    Notations.DoubleColon Self "insert" := {
    Notations.double_colon := insert;
  }.
  
  (*
      fn new() -> Mapping<K, V> {
          unimplemented!()
      }
  *)
  Parameter new : M (mapping_integration_tests.Mapping.t K V).
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      fn remove(&self, _key: K) {
          unimplemented!()
      }
  *)
  Parameter remove : (ref Self) -> K -> M unit.
  
  Global Instance AssociatedFunction_remove :
    Notations.DoubleColon Self "remove" := {
    Notations.double_colon := remove;
  }.
  
  (*
      fn size(&self, _key: K) -> Option<u32> {
          unimplemented!()
      }
  *)
  Parameter size : (ref Self) -> K -> M (core.option.Option.t u32.t).
  
  Global Instance AssociatedFunction_size :
    Notations.DoubleColon Self "size" := {
    Notations.double_colon := size;
  }.
  
  (*
      fn take(&self, _key: K) -> Option<V> {
          unimplemented!()
      }
  *)
  Parameter take : (ref Self) -> K -> M (core.option.Option.t V).
  
  Global Instance AssociatedFunction_take :
    Notations.DoubleColon Self "take" := {
    Notations.double_colon := take;
  }.
End Impl_mapping_integration_tests_Mapping_t_K_V.
End Impl_mapping_integration_tests_Mapping_t_K_V.

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

Module  Impl_core_default_Default_for_mapping_integration_tests_AccountId_t.
Section Impl_core_default_Default_for_mapping_integration_tests_AccountId_t.
  Definition Self : Set := mapping_integration_tests.AccountId.t.
  
  (*
  Default
  *)
  Parameter default : M mapping_integration_tests.AccountId.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_mapping_integration_tests_AccountId_t.
End Impl_core_default_Default_for_mapping_integration_tests_AccountId_t.

Module  Impl_core_clone_Clone_for_mapping_integration_tests_AccountId_t.
Section Impl_core_clone_Clone_for_mapping_integration_tests_AccountId_t.
  Definition Self : Set := mapping_integration_tests.AccountId.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref Self) -> M mapping_integration_tests.AccountId.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_mapping_integration_tests_AccountId_t.
End Impl_core_clone_Clone_for_mapping_integration_tests_AccountId_t.

Module  Impl_core_marker_Copy_for_mapping_integration_tests_AccountId_t.
Section Impl_core_marker_Copy_for_mapping_integration_tests_AccountId_t.
  Definition Self : Set := mapping_integration_tests.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_mapping_integration_tests_AccountId_t.
End Impl_core_marker_Copy_for_mapping_integration_tests_AccountId_t.

Ltac Balance := exact u128.t.

Module  Env.
Section Env.
  Record t : Set := {
    caller : mapping_integration_tests.AccountId.t;
  }.
  
  Global Instance Get_caller : Notations.Dot "caller" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(caller))
        (fun β α => Some (α <| caller := β |>));
  }.
  Global Instance Get_AF_caller : Notations.DoubleColon t "caller" := {
    Notations.double_colon (α : M.Val t) := α.["caller"];
  }.
End Env.
End Env.

Module  Impl_mapping_integration_tests_Env_t.
Section Impl_mapping_integration_tests_Env_t.
  Definition Self : Set := mapping_integration_tests.Env.t.
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Parameter caller : (ref Self) -> M mapping_integration_tests.AccountId.t.
  
  Global Instance AssociatedFunction_caller :
    Notations.DoubleColon Self "caller" := {
    Notations.double_colon := caller;
  }.
End Impl_mapping_integration_tests_Env_t.
End Impl_mapping_integration_tests_Env_t.

Module  Mappings.
Section Mappings.
  Record t : Set := {
    balances :
      mapping_integration_tests.Mapping.t
        mapping_integration_tests.AccountId.t
        ltac:(mapping_integration_tests.Balance);
  }.
  
  Global Instance Get_balances : Notations.Dot "balances" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(balances))
        (fun β α => Some (α <| balances := β |>));
  }.
  Global Instance Get_AF_balances : Notations.DoubleColon t "balances" := {
    Notations.double_colon (α : M.Val t) := α.["balances"];
  }.
End Mappings.
End Mappings.

Module  Impl_core_default_Default_for_mapping_integration_tests_Mappings_t.
Section Impl_core_default_Default_for_mapping_integration_tests_Mappings_t.
  Definition Self : Set := mapping_integration_tests.Mappings.t.
  
  (*
  Default
  *)
  Parameter default : M mapping_integration_tests.Mappings.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_mapping_integration_tests_Mappings_t.
End Impl_core_default_Default_for_mapping_integration_tests_Mappings_t.

Module  Impl_mapping_integration_tests_Mappings_t.
Section Impl_mapping_integration_tests_Mappings_t.
  Definition Self : Set := mapping_integration_tests.Mappings.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : M mapping_integration_tests.Env.t.
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon Self "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env() -> Env {
          unimplemented!()
      }
  *)
  Parameter env : M mapping_integration_tests.Env.t.
  
  Global Instance AssociatedFunction_env : Notations.DoubleColon Self "env" := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new() -> Self {
          let balances = Mapping::default();
          Self { balances }
      }
  *)
  Parameter new : M Self.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn get_balance(&self) -> Option<Balance> {
          let caller = Self::env().caller();
          self.balances.get(&caller)
      }
  *)
  Parameter get_balance :
      (ref Self) ->
        M (core.option.Option.t ltac:(mapping_integration_tests.Balance)).
  
  Global Instance AssociatedFunction_get_balance :
    Notations.DoubleColon Self "get_balance" := {
    Notations.double_colon := get_balance;
  }.
  
  (*
      pub fn insert_balance(&mut self, value: Balance) -> Option<u32> {
          let caller = Self::env().caller();
          self.balances.insert(caller, value)
      }
  *)
  Parameter insert_balance :
      (mut_ref Self) ->
        ltac:(mapping_integration_tests.Balance) ->
        M (core.option.Option.t u32.t).
  
  Global Instance AssociatedFunction_insert_balance :
    Notations.DoubleColon Self "insert_balance" := {
    Notations.double_colon := insert_balance;
  }.
  
  (*
      pub fn size_balance(&mut self) -> Option<u32> {
          let caller = Self::env().caller();
          self.balances.size(caller)
      }
  *)
  Parameter size_balance : (mut_ref Self) -> M (core.option.Option.t u32.t).
  
  Global Instance AssociatedFunction_size_balance :
    Notations.DoubleColon Self "size_balance" := {
    Notations.double_colon := size_balance;
  }.
  
  (*
      pub fn contains_balance(&self) -> bool {
          let caller = Self::env().caller();
          self.balances.contains(&caller)
      }
  *)
  Parameter contains_balance : (ref Self) -> M bool.t.
  
  Global Instance AssociatedFunction_contains_balance :
    Notations.DoubleColon Self "contains_balance" := {
    Notations.double_colon := contains_balance;
  }.
  
  (*
      pub fn remove_balance(&mut self) {
          let caller = Self::env().caller();
          self.balances.remove(caller);
      }
  *)
  Parameter remove_balance : (mut_ref Self) -> M unit.
  
  Global Instance AssociatedFunction_remove_balance :
    Notations.DoubleColon Self "remove_balance" := {
    Notations.double_colon := remove_balance;
  }.
  
  (*
      pub fn take_balance(&mut self) -> Option<Balance> {
          let caller = Self::env().caller();
          self.balances.take(caller)
      }
  *)
  Parameter take_balance :
      (mut_ref Self) ->
        M (core.option.Option.t ltac:(mapping_integration_tests.Balance)).
  
  Global Instance AssociatedFunction_take_balance :
    Notations.DoubleColon Self "take_balance" := {
    Notations.double_colon := take_balance;
  }.
End Impl_mapping_integration_tests_Mappings_t.
End Impl_mapping_integration_tests_Mappings_t.