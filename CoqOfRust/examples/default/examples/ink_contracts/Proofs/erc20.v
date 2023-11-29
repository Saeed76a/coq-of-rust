Require Import CoqOfRust.CoqOfRust.
Require Import Lia.
Require Import CoqOfRust.Proofs.M.
Require Import CoqOfRust.lib.Proofs.lib.
Require CoqOfRust.examples.default.examples.ink_contracts.Simulations.erc20.
Require CoqOfRust.examples.default.examples.ink_contracts.erc20.

(** ** Definition of state and allocation. *)

Module State.
  Definition t : Set := option erc20.Erc20.t.
End State.

Module Address.
  Definition t : Set := unit.
End Address.

Module StateInstance.
  Global Instance I : State.Trait State.t Address.t := {
    State.get_Set address :=
      match address with
      | tt => erc20.Erc20.t
      end;
    State.read address state :=
      match address with
      | tt => state
      end;
    State.alloc_write address state value :=
      match address, value with
      | tt, value => Some (Some value)
      end;
  }.

  Lemma is_valid : State.Valid.t I.
  Proof.
    sauto lq: on rew: off.
  Qed.
End StateInstance.

Module Erc20.
  Module Valid.
    Record t (storage : erc20.Erc20.t) : Prop := {
      total_supply : u128.Valid.t storage.(erc20.Erc20.total_supply);
      balances : forall owner balance,
        Lib.Mapping.get owner storage.(erc20.Erc20.balances) =
          option.Option.Some balance ->
        u128.Valid.t balance;
      allowances : forall owner spender allowance,
        Lib.Mapping.get (owner, spender) storage.(erc20.Erc20.allowances) =
          option.Option.Some allowance ->
        u128.Valid.t allowance;
    }.
  End Valid.
End Erc20.

(** ** Verification of the simulations. *)

(** The simulation [total_supply] is equal. *)
Lemma run_total_supply
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    fuel :
  let state := Some storage in
  let self := Ref.mut_ref tt in
  Run.t
    fuel env
    (erc20.Impl_erc20_Erc20_t_2.total_supply self)
    state
    (Some (Simulations.erc20.total_supply storage, state)).
Proof.
  unfold erc20.Impl_erc20_Erc20_t_2.total_supply; simpl.
  run_symbolic.
Qed.

(** The simulation [balance_of_impl] is equal. *)
Lemma run_balance_of_impl
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    (owner : erc20.AccountId.t)
    fuel :
  let state := Some storage in
  let self := Ref.mut_ref tt in
  let ref_owner : ref erc20.AccountId.t := Ref.Imm owner in
  Run.t
    fuel env
    (erc20.Impl_erc20_Erc20_t_2.balance_of_impl self ref_owner)
    state
    (Some (Simulations.erc20.balance_of_impl storage owner, state)).
Proof.
  unfold
    erc20.Impl_erc20_Erc20_t_2.balance_of_impl,
    Simulations.erc20.balance_of_impl;
    simpl.
  destruct (Lib.Mapping.get owner storage.(erc20.Erc20.balances)) eqn:H_get;
    repeat (
      run_symbolic ||
      simpl ||
      rewrite H_get
    ).
Qed.

(** The simulation [balance_of_impl] is valid. *)
Lemma balance_of_impl_is_valid
  (storage : erc20.Erc20.t)
  (owner : erc20.AccountId.t)
  (H_storage : Erc20.Valid.t storage) :
  u128.Valid.t (Simulations.erc20.balance_of_impl storage owner).
Proof.
  unfold Simulations.erc20.balance_of_impl, u128.Valid.t.
  destruct Lib.Mapping.get  eqn:H_get; simpl.
  { lia. }
  { destruct H_storage; hauto q: on. }
Qed.

(** The simulation [balance_of] is equal. *)
Lemma run_balance_of
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    (owner : erc20.AccountId.t)
    fuel :
  let state := Some storage in
  let self := Ref.mut_ref tt in
  Run.t
    fuel env
    (erc20.Impl_erc20_Erc20_t_2.balance_of self owner)
    state
    (Some (Simulations.erc20.balance_of storage owner, state)).
Proof.
  unfold
    erc20.Impl_erc20_Erc20_t_2.balance_of,
    Simulations.erc20.balance_of;
    simpl.
  with_strategy opaque [erc20.Impl_erc20_Erc20_t_2.balance_of_impl]
    run_symbolic.
  apply run_balance_of_impl.
Qed.

(** The simulation [allowance_impl] is equal. *)
Lemma run_allowance_impl
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    (owner : erc20.AccountId.t)
    (spender : erc20.AccountId.t)
    fuel :
  let state := Some storage in
  let self := Ref.mut_ref tt in
  let ref_owner : ref erc20.AccountId.t := Ref.Imm owner in
  let ref_spender : ref erc20.AccountId.t := Ref.Imm spender in
  Run.t
    fuel env
    (erc20.Impl_erc20_Erc20_t_2.allowance_impl self ref_owner ref_spender)
    state
    (Some (Simulations.erc20.allowance_impl storage owner spender, state)).
Proof.
  unfold
    erc20.Impl_erc20_Erc20_t_2.allowance_impl,
    Simulations.erc20.allowance_impl;
    simpl.
  destruct (Lib.Mapping.get (owner, spender) storage.(erc20.Erc20.allowances))
    eqn:H_get;
    repeat (
      run_symbolic ||
      simpl ||
      rewrite H_get
    ).
Qed.

(** The simulation [allowance] is equal. *)
Lemma run_allowance
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    (owner : erc20.AccountId.t)
    (spender : erc20.AccountId.t)
    fuel :
  let state := Some storage in
  let self := Ref.mut_ref tt in
  Run.t
    fuel env
    (erc20.Impl_erc20_Erc20_t_2.allowance self owner spender)
    state
    (Some (Simulations.erc20.allowance storage owner spender, state)).
Proof.
  unfold
    erc20.Impl_erc20_Erc20_t_2.allowance,
    Simulations.erc20.allowance;
    simpl.
  with_strategy opaque [erc20.Impl_erc20_Erc20_t_2.allowance_impl]
    run_symbolic.
  apply run_allowance_impl.
Qed.

Lemma sub_eq_optimistic (v1 v2 : u128.t) :
    u128.Valid.t v1 ->
    u128.Valid.t v2 ->
    v1 <u128 v2 = false ->
    BinOp.Panic.sub v1 v2 =
    M.pure (BinOp.Optimistic.sub v1 v2).
Proof.
  unfold u128.Valid.t.
  unfold
    BinOp.Panic.sub,
    BinOp.Panic.make_arithmetic,
    Integer.normalize_panic,
    Integer.normalize_option.
  unfold
    BinOp.Pure.lt,
    BinOp.Pure.make_comparison.
  simpl.
  intros; destruct v1, v2.
  repeat (destruct (_ <? _) eqn:? in |- *; [lia|]).
  reflexivity.
Qed.

(** The simulation [transfer_from_to] is equal. *)
Lemma run_transfer_from_to
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    (from : erc20.AccountId.t)
    (to : erc20.AccountId.t)
    (value : ltac:(erc20.Balance))
    fuel
    (H_storage : Erc20.Valid.t storage)
    (H_value : u128.Valid.t value) :
  let state := Some storage in
  let self := Ref.mut_ref tt in
  let ref_from : ref erc20.AccountId.t := Ref.Imm from in
  let ref_to : ref erc20.AccountId.t := Ref.Imm to in
  let simulation :=
    let? '(result, storage) :=
      Simulations.erc20.transfer_from_to storage from to value in
    return? (result, Some storage) in
  Run.t
    fuel env
    (erc20.Impl_erc20_Erc20_t_2.transfer_from_to self ref_from ref_to value)
    state
    simulation.
Proof.
  unfold
    erc20.Impl_erc20_Erc20_t_2.transfer_from_to,
    Simulations.erc20.transfer_from_to;
    simpl.
  destruct (_ <u128 _) eqn:H_lt; simpl.
  { repeat (
      with_strategy opaque [erc20.Impl_erc20_Erc20_t_2.balance_of_impl]
        run_symbolic ||
      apply run_balance_of_impl ||
      rewrite H_lt ||
      simpl
    ).
  }
  { destruct BinOp.Option.add eqn:H_add; simpl;
      repeat eexists;
      repeat (
        with_strategy opaque [erc20.Impl_erc20_Erc20_t_2.balance_of_impl]
          run_symbolic ||
        apply run_balance_of_impl ||
        rewrite H_lt ||
        (rewrite sub_eq_optimistic;
          try apply balance_of_impl_is_valid;
          try assumption) ||
        (unfold
          BinOp.Panic.add,
          BinOp.Panic.make_arithmetic,
          Integer.normalize_panic,
          BinOp.Option.add,
          BinOp.Option.make_arithmetic
          in *;
          rewrite H_add; clear H_add) ||
        simpl
      ).
  }
Qed.
(*
(** The simulation [transfer] is equal. *)
Lemma run_transfer
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    (to : erc20.AccountId.t)
    (value : ltac:(erc20.Balance))
    fuel :
  let state := Some storage in
  let self := Ref.mut_ref tt in
  let simulation :=
    let? '(result, storage) :=
      Simulations.erc20.transfer env storage to value in
    return? (result, Some storage) in
  Run.t
    fuel env
    (erc20.Impl_erc20_Erc20_t_2.transfer self to value)
    state
    simulation.
Proof.
  unfold erc20.Impl_erc20_Erc20_t_2.transfer,
    Simulations.erc20.transfer.
  destruct erc20.transfer_from_to as [[result storage']|] eqn:H_from_to; simpl.
  apply run_transfer_from_to.
  with_strategy opaque [erc20.Impl_erc20_Erc20_t_2.transfer_from_to]
    run_symbolic.
  apply run_transfer_from_to.
  all: run_symbolic.
Qed.

(** The simulation [approve] is equal. *)
Lemma run_approve
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    (spender : erc20.AccountId.t)
    (value : ltac:(erc20.Balance))
    fuel :
  let state := Some storage in
  let self := Ref.mut_ref tt in
  let simulation :=
    Simulations.erc20.approve env storage spender value in
  Run.t
    fuel env
    (erc20.Impl_erc20_Erc20_t_2.approve self spender value)
    state
    (inl (fst simulation))
    (Some (snd simulation)).
Proof.
  unfold erc20.Impl_erc20_Erc20_t_2.approve,
    Simulations.erc20.approve.
  repeat (simpl || run_symbolic).
Qed.

(** The simulation [transfer_from] is equal. *)
Lemma run_transfer_from
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    (from : erc20.AccountId.t)
    (to : erc20.AccountId.t)
    (value : ltac:(erc20.Balance))
    fuel :
  let state := Some storage in
  let self := Ref.mut_ref tt in
  let simulation :=
    Simulations.erc20.transfer_from env storage from to value in
  Run.t
    fuel env
    (erc20.Impl_erc20_Erc20_t_2.transfer_from self from to value)
    state
    (inl (fst simulation))
    (Some (snd simulation)).
Proof.
  unfold erc20.Impl_erc20_Erc20_t_2.transfer_from,
    Simulations.erc20.transfer_from.
  destruct erc20.transfer_from_to as [result storage'] eqn:H_from_to.
  destruct result as [[]|] eqn:H_result;
    destruct (_ <u128 _) eqn:H_lt;
    repeat (
      simpl ||
      with_strategy opaque [
          erc20.Impl_erc20_Erc20_t_2.allowance_impl
          erc20.Impl_erc20_Erc20_t_2.transfer_from_to
        ]
        run_symbolic ||
      apply run_allowance_impl ||
      apply run_transfer_from_to ||
      rewrite H_lt ||
      rewrite H_from_to
    ).
Qed.

(** ** Standalone proofs. *)

(** Starting from a state with a given [balance] for a given [owner], when we
    read that information we get the expected [balance]. *)
Lemma balance_of_impl_read_id
    (env : erc20.Env.t)
    (owner : erc20.AccountId.t)
    (balance : u128.t)
    fuel :
  let storage := {|
    erc20.Erc20.total_supply := u128.Make 0;
    erc20.Erc20.balances := Lib.Mapping.insert owner balance Lib.Mapping.empty;
    erc20.Erc20.allowances := Lib.Mapping.empty;
  |} in
  (* An initial state *)
  let state := Some storage in
  (* The value [self] is allocated in the state *)
  let self : ref erc20.Erc20.t := Ref.mut_ref tt in
  (* The value [owner] is an immediate value *)
  let ref_owner : ref erc20.AccountId.t := Ref.Imm owner in
  Run.t
    fuel env
    (erc20.Impl_erc20_Erc20_t_2.balance_of_impl self ref_owner)
    state
    (* expected output *)
    (inl balance)
    (* the state does not change *)
    state.
Proof.
  intros.
  replace balance with (erc20.balance_of_impl storage owner).
  apply run_balance_of_impl.
  unfold erc20.balance_of_impl.
  simpl.
  now rewrite Lib.Mapping.get_insert_eq.
Qed.

(** ** Serialization of messages and global reasoning. *)

Module ReadMessage.
  (** A message that only read the store. *)
  Inductive t : Set -> Set :=
  | total_supply :
    t ltac:(erc20.Balance)
  | balance_of
    (owner : erc20.AccountId.t) :
    t ltac:(erc20.Balance)
  | allowance
    (owner : erc20.AccountId.t)
    (spender : erc20.AccountId.t) :
    t ltac:(erc20.Balance)
  .

  Definition dispatch {A : Set} (message : t A) : M A :=
    let self := Ref.mut_ref tt in
    match message with
    | total_supply => erc20.Impl_erc20_Erc20_t_2.total_supply self
    | balance_of owner =>
      erc20.Impl_erc20_Erc20_t_2.balance_of self owner
    | allowance owner spender =>
      erc20.Impl_erc20_Erc20_t_2.allowance
        self
        owner
        spender
    end.

  Definition simulation_dispatch
      {A : Set}
      (env : erc20.Env.t)
      (storage : erc20.Erc20.t)
      (message : t A) :
      A :=
    match message with
    | total_supply =>
      Simulations.erc20.total_supply storage
    | balance_of owner =>
      Simulations.erc20.balance_of storage owner
    | allowance owner spender =>
      Simulations.erc20.allowance storage owner spender
    end.

  (** The simulation [simulation_dispatch] is valid. *)
  Lemma run_dispatch
      {A : Set}
      fuel
      (env : erc20.Env.t)
      (storage : erc20.Erc20.t)
      (message : t A) :
    let simulation := simulation_dispatch env storage message in
    Run.t
      env
      (dispatch message)
      (Some storage)
      (inl simulation)
      (Some storage).
  Proof.
    destruct message; simpl.
    { apply run_total_supply. }
    { apply run_balance_of. }
    { apply run_allowance. }
  Qed.
End ReadMessage.

Module WriteMessage.
  (** A message that can mutate the store. *)
  Inductive t : Set :=
  | transfer
    (to : erc20.AccountId.t)
    (value : ltac:(erc20.Balance)) :
    t
  | approve
    (spender : erc20.AccountId.t)
    (value : ltac:(erc20.Balance)) :
    t
  | transfer_from
    (from : erc20.AccountId.t)
    (to : erc20.AccountId.t)
    (value : ltac:(erc20.Balance)) :
    t
  .

  Module Valid.
    Definition t (write_message : t) : Prop :=
      match write_message with
      | transfer _ value => u128.Valid.t value
      | approve _ value => u128.Valid.t value
      | transfer_from _ _ value => u128.Valid.t value
      end.
  End Valid.

  Definition dispatch (message : t) : M ltac:(erc20.Result unit) :=
    let self := Ref.mut_ref tt in
    match message with
    | transfer to value =>
      erc20.Impl_erc20_Erc20_t_2.transfer
        self
        to
        value
    | approve spender value =>
      erc20.Impl_erc20_Erc20_t_2.approve
        self
        spender
        value
    | transfer_from from to value =>
      erc20.Impl_erc20_Erc20_t_2.transfer_from
        self
        from
        to
        value
    end.

  Definition simulation_dispatch
      (env : erc20.Env.t)
      (storage : erc20.Erc20.t)
      (message : t) :
      ltac:(erc20.Result unit) * erc20.Erc20.t :=
    match message with
    | transfer to value =>
      Simulations.erc20.transfer env storage to value
    | approve spender value =>
      Simulations.erc20.approve env storage spender value
    | transfer_from from to value =>
      Simulations.erc20.transfer_from env storage from to value
    end.

  (** The simulation [simulation_dispatch] is valid. *)
  Lemma run_dispatch
      fuel
      (env : erc20.Env.t)
      (storage : erc20.Erc20.t)
      (message : t) :
    let simulation := simulation_dispatch env storage message in
    Run.t
      env
      (dispatch message)
      (Some storage)
      (inl (fst simulation))
      (Some (snd simulation)).
  Proof.
    destruct message; simpl.
    { apply run_transfer. }
    { apply run_approve. }
    { apply run_transfer_from. }
  Qed.
End WriteMessage.

(** There are no panics with read messages. *)
Lemma read_message_no_panic
    (env : erc20.Env.t)
    (message : ReadMessage.t ltac:(erc20.Balance))
    (storage : erc20.Erc20.t)
    fuel :
  let state := Some storage in
  exists result,
  Run.t
    fuel env
    (ReadMessage.dispatch message)
    state
    (* no errors in the result *)
    (inl result)
    (* the state does not change *)
    state.
Proof.
  destruct message; simpl.
  { eexists.
    apply run_total_supply.
  }
  { eexists.
    apply run_balance_of.
  }
  { eexists.
    apply run_allowance.
  }
Qed.

Definition sum_of_money (storage : erc20.Erc20.t) : Z :=
  Lib.Mapping.sum
    Integer.to_Z
    storage.(erc20.Erc20.balances).

Module Erc20.
  Module Valid.
    (** Validity predicate for the storage. *)
    Definition t (storage : erc20.Erc20.t) : Prop :=
      Integer.to_Z storage.(erc20.Erc20.total_supply) =
      sum_of_money storage.
  End Valid.
End Erc20.

Lemma account_id_eq_dec (x y : erc20.AccountId.t) :
  {x = y} + {x <> y}.
Proof.
  destruct x as [[x]], y as [[y]].
  destruct (Z.eq_dec x y); sfirstorder.
Qed.

Lemma transfer_from_to_is_valid
    (storage : erc20.Erc20.t)
    (from : erc20.AccountId.t)
    (to : erc20.AccountId.t)
    (value : ltac:(erc20.Balance))
    (H_storage : Erc20.Valid.t storage)
    (H_value : u128.Valid.t value) :
  let '(result, storage) :=
    Simulations.erc20.transfer_from_to storage from to value in
  Erc20.Valid.t storage.
Proof.
  destruct value as [value].
  unfold Erc20.Valid.t in *.
  unfold Simulations.erc20.transfer_from_to; simpl.
  destruct (_ <u128 _) eqn:H_lt; [trivial|]; simpl.
  unfold sum_of_money in *; simpl.
  unfold erc20.balance_of_impl; simpl.
  repeat rewrite Lib.Mapping.sum_insert.
  lia.
  unfold u128.t.
  lia.
Qed.

Lemma transfer_is_valid
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    (to : erc20.AccountId.t)
    (value : ltac:(erc20.Balance))
    (H_storage : Erc20.Valid.t storage)
    (H_value : value >= 0) :
  let '(result, storage) :=
    Simulations.erc20.transfer env storage to value in
  Erc20.Valid.t storage.
Proof.
  now apply transfer_from_to_is_valid.
Qed.

Lemma approve_is_valid
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    (spender : erc20.AccountId.t)
    (value : ltac:(erc20.Balance))
    (H_storage : Erc20.Valid.t storage)
    (H_value : value >= 0) :
  let '(result, storage) :=
    Simulations.erc20.approve env storage spender value in
  Erc20.Valid.t storage.
Proof.
  apply H_storage.
Qed.

Lemma transfer_from_is_valid
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    (from : erc20.AccountId.t)
    (to : erc20.AccountId.t)
    (value : ltac:(erc20.Balance))
    (H_storage : Erc20.Valid.t storage)
    (H_value : value >= 0) :
  let '(result, storage) :=
    Simulations.erc20.transfer_from env storage from to value in
  Erc20.Valid.t storage.
Proof.
  unfold Simulations.erc20.transfer_from.
  destruct (_ <? _) eqn:H_lt; [trivial|]; simpl.
  pose proof (transfer_from_to_is_valid storage from to value).
  destruct erc20.transfer_from_to as [result ?].
  destruct result; sfirstorder.
Qed.

(** The sum of money in the storage is constant. *)
Lemma sum_of_money_is_constant
    (env : erc20.Env.t)
    (storage : erc20.Erc20.t)
    (write_message : WriteMessage.t)
    (H_storage : Erc20.Valid.t storage)
    (H_write_message : WriteMessage.Valid.t write_message) :
  let state := Some storage in
  let '(result, storage) :=
    WriteMessage.simulation_dispatch env storage write_message in
  Erc20.Valid.t storage.
Proof.
  intros.
  destruct write_message; simpl.
  { now apply transfer_is_valid. }
  { now apply approve_is_valid. }
  { now apply transfer_from_is_valid. }
Qed.
*)