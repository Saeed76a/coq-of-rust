Require Import CoqOfRust.CoqOfRust.
Require Import CoqOfRust.simulations.M.
Require Import CoqOfRust.lib.lib.

Import simulations.M.Notations.

Require CoqOfRust.move_sui.simulations.move_binary_format.file_format.
Module Bytecode := file_format.Bytecode.
Module FunctionHandleIndex := file_format.FunctionHandleIndex.
Module FunctionInstantiationIndex := file_format.FunctionInstantiationIndex.

Require CoqOfRust.move_sui.simulations.move_vm_types.values.values_impl.
Module Locals := values_impl.Locals.
Module Value := values_impl.Value.

Require CoqOfRust.move_sui.simulations.move_binary_format.errors.
Module PartialVMResult := errors.PartialVMResult.
Module PartialVMError := errors.PartialVMError.

Require CoqOfRust.move_sui.simulations.move_vm_runtime.loader.
Module Function := loader.Function.
Module Resolver := loader.Resolver.

Require CoqOfRust.move_sui.simulations.move_core_types.vm_status.
Module StatusCode := vm_status.StatusCode.

(* TODO(progress):
- Define Lens for State -> Interpreter
- Define Lens for Interpreter -> Stack
- Write the basic framework for that function
*)

(* NOTE(STUB): only implement if necessary *)
Module _Type.
  Parameter t : Set.
End _Type.

(* **************** *)

(* NOTE: This trait doesn't have a complete implementation throughout the library. We might be able to just ignore its occurence
/// Trait that defines a generic gas meter interface, allowing clients of the Move VM to implement
/// their own metering scheme.
pub trait GasMeter {
    /// Charge an instruction and fail if not enough gas units are left.
    fn charge_simple_instr(&mut self, instr: SimpleInstruction) -> PartialVMResult<()>;

    fn charge_pop(&mut self, popped_val: impl ValueView) -> PartialVMResult<()>;

    fn charge_call(
        &mut self,
        module_id: &ModuleId,
        func_name: &str,
        args: impl ExactSizeIterator<Item = impl ValueView>,
        num_locals: NumArgs,
    ) -> PartialVMResult<()>;

    fn charge_call_generic(
        &mut self,
        module_id: &ModuleId,
        func_name: &str,
        ty_args: impl ExactSizeIterator<Item = impl TypeView>,
        args: impl ExactSizeIterator<Item = impl ValueView>,
        num_locals: NumArgs,
    ) -> PartialVMResult<()>;

    fn charge_ld_const(&mut self, size: NumBytes) -> PartialVMResult<()>;

    fn charge_ld_const_after_deserialization(&mut self, val: impl ValueView)
        -> PartialVMResult<()>;

    fn charge_copy_loc(&mut self, val: impl ValueView) -> PartialVMResult<()>;

    fn charge_move_loc(&mut self, val: impl ValueView) -> PartialVMResult<()>;

    fn charge_store_loc(&mut self, val: impl ValueView) -> PartialVMResult<()>;

    fn charge_pack(
        &mut self,
        is_generic: bool,
        args: impl ExactSizeIterator<Item = impl ValueView>,
    ) -> PartialVMResult<()>;

    fn charge_unpack(
        &mut self,
        is_generic: bool,
        args: impl ExactSizeIterator<Item = impl ValueView>,
    ) -> PartialVMResult<()>;

    fn charge_read_ref(&mut self, val: impl ValueView) -> PartialVMResult<()>;

    fn charge_write_ref(
        &mut self,
        new_val: impl ValueView,
        old_val: impl ValueView,
    ) -> PartialVMResult<()>;

    fn charge_eq(&mut self, lhs: impl ValueView, rhs: impl ValueView) -> PartialVMResult<()>;

    fn charge_neq(&mut self, lhs: impl ValueView, rhs: impl ValueView) -> PartialVMResult<()>;

    fn charge_vec_pack<'a>(
        &mut self,
        ty: impl TypeView + 'a,
        args: impl ExactSizeIterator<Item = impl ValueView>,
    ) -> PartialVMResult<()>;

    fn charge_vec_len(&mut self, ty: impl TypeView) -> PartialVMResult<()>;

    fn charge_vec_borrow(
        &mut self,
        is_mut: bool,
        ty: impl TypeView,
        is_success: bool,
    ) -> PartialVMResult<()>;

    fn charge_vec_push_back(
        &mut self,
        ty: impl TypeView,
        val: impl ValueView,
    ) -> PartialVMResult<()>;

    fn charge_vec_pop_back(
        &mut self,
        ty: impl TypeView,
        val: Option<impl ValueView>,
    ) -> PartialVMResult<()>;

    // TODO(Gas): Expose the elements
    fn charge_vec_unpack(
        &mut self,
        ty: impl TypeView,
        expect_num_elements: NumArgs,
        elems: impl ExactSizeIterator<Item = impl ValueView>,
    ) -> PartialVMResult<()>;

    // TODO(Gas): Expose the two elements
    fn charge_vec_swap(&mut self, ty: impl TypeView) -> PartialVMResult<()>;

    fn charge_native_function(
        &mut self,
        amount: InternalGas,
        ret_vals: Option<impl ExactSizeIterator<Item = impl ValueView>>,
    ) -> PartialVMResult<()>;

    fn charge_native_function_before_execution(
        &mut self,
        ty_args: impl ExactSizeIterator<Item = impl TypeView>,
        args: impl ExactSizeIterator<Item = impl ValueView>,
    ) -> PartialVMResult<()>;

    fn charge_drop_frame(
        &mut self,
        locals: impl Iterator<Item = impl ValueView>,
    ) -> PartialVMResult<()>;

    /// Returns the gas left
    fn remaining_gas(&self) -> InternalGas;

    fn get_profiler_mut(&mut self) -> Option<&mut GasProfiler>;

    fn set_profiler(&mut self, profiler: GasProfiler);
}
*)

(* 
enum ExitCode {
    Return,
    Call(FunctionHandleIndex),
    CallGeneric(FunctionInstantiationIndex),
}
*)
Module ExitCode.
  Inductive t : Set := 
  | Return
  | Call : FunctionHandleIndex.t -> t
  | CallGeneric : FunctionInstantiationIndex.t -> t
  .
End ExitCode.

(* 
enum InstrRet {
    Ok,
    ExitCode(ExitCode),
    Branch,
}
*)
Module InstrRet.
  Inductive t : Set :=
  | Ok
  | ExitCode : ExitCode.t -> t
  | Branch
  .
End InstrRet.


(* // TODO Determine stack size limits based on gas limit
const OPERAND_STACK_SIZE_LIMIT: usize = 1024;
const CALL_STACK_SIZE_LIMIT: usize = 1024; *)

Definition OPERAND_STACK_SIZE_LIMIT : Z := 1024.
Definition CALL_STACK_SIZE_LIMIT : Z := 1024.

(* /// The operand stack.
struct Stack {
    value: Vec<Value>,
} *)
Module Stack.
  Record t := { value : list Value.t }.
  (* 
  impl Stack {

      /// Pop a `Value` of a given type off the stack. Abort if the value is not of the given
      /// type or if the stack is empty.
      fn pop_as<T>(&mut self) -> PartialVMResult<T>
      where
          Value: VMValueCast<T>,
      {
          self.pop()?.value_as()
      }

      /// Pop n values off the stack.
      fn popn(&mut self, n: u16) -> PartialVMResult<Vec<Value>> {
          let remaining_stack_size = self
              .value
              .len()
              .checked_sub(n as usize)
              .ok_or_else(|| PartialVMError::new(StatusCode::EMPTY_VALUE_STACK))?;
          let args = self.value.split_off(remaining_stack_size);
          Ok(args)
      }

      fn last_n(&self, n: usize) -> PartialVMResult<impl ExactSizeIterator<Item = &Value>> {
          if self.value.len() < n {
              return Err(PartialVMError::new(StatusCode::EMPTY_VALUE_STACK)
                  .with_message("Failed to get last n arguments on the argument stack".to_string()));
          }
          Ok(self.value[(self.value.len() - n)..].iter())
      }
  }
  *)
  Module Impl_Stack.
    Definition Self : Set := move_sui.simulations.move_vm_runtime.interpreter.Stack.t.

    (* 
    /// Create a new empty operand stack.
    fn new() -> Self {
        Stack { value: vec![] }
    }
    *)
    Definition new : Self := Build_t [].

    (* 
    /// Push a `Value` on the stack if the max stack size has not been reached. Abort execution
    /// otherwise.
    fn push(&mut self, value: Value) -> PartialVMResult<()> {
        if self.value.len() < OPERAND_STACK_SIZE_LIMIT {
            self.value.push(value);
            Ok(())
        } else {
            Err(PartialVMError::new(StatusCode::EXECUTION_STACK_OVERFLOW))
        }
    }
    *)
    Definition push (value : Value.t) : MS? Self string (PartialVMResult.t unit) :=
      letS? self := readS? in
      let '(Build_t self_value) := self in
      if (Z.of_nat $ List.length self_value) <? OPERAND_STACK_SIZE_LIMIT
      then 
        (* We push at the end of the list *)
        letS? _ := writeS? $ self <| Stack.value := List.app self_value [value] |> in
        returnS? $ Result.Ok tt
      else returnS? $ Result.Err $ 
        PartialVMError.Impl_PartialVMError.new StatusCode.EXECUTION_STACK_OVERFLOW.

    (* 
    /// Pop a `Value` off the stack or abort execution if the stack is empty.
    fn pop(&mut self) -> PartialVMResult<Value> {
        self.value
            .pop()
            .ok_or_else(|| PartialVMError::new(StatusCode::EMPTY_VALUE_STACK))
    }
    *)
    Definition pop : MS? Self string (PartialVMResult.t Value.t) :=
      letS? self := readS? in
      (* We check manually if we can pop an element *)
      let '(Build_t self_value) := self in 
      let self_value := List.rev self_value in
      match self_value with
      | x :: xs => 
        let self_value := List.rev xs in
        letS? _ := writeS? self <| Stack.value := self_value |> in
        returnS? $ Result.Ok x
      | _ => returnS? $ Result.Err $ 
        PartialVMError.Impl_PartialVMError.new StatusCode.EMPTY_VALUE_STACK
      end.
  End Impl_Stack.
End Stack.

(* 
/// `Interpreter` instances can execute Move functions.
///
/// An `Interpreter` instance is a stand alone execution context for a function.
/// It mimics execution on a single thread, with an call stack and an operand stack.
pub(crate) struct Interpreter {
    /// Operand stack, where Move `Value`s are stored for stack operations.
    operand_stack: Stack,
    /// The stack of active functions.
    call_stack: CallStack,
    /// Limits imposed at runtime
    runtime_limits_config: VMRuntimeLimitsConfig,
}
*)
Module Interpreter.
  Record t : Set := {
    operand_stack : Stack.t;
    (* call_stack : CallStack.t; *)
    (* runtime_limits_config : VMRuntimeLimitsConfig.t; *)
  }.
End Interpreter.

(* 
struct Frame {
    pc: u16,
    locals: Locals,
    function: Arc<Function>,
    ty_args: Vec<Type>,
}
*)
Module Frame.
  Record t : Set := {
    pc : Z;
    locals : Locals.t;
    function : Function.t;
    ty_args : list _Type.t;
  }.
End Frame.

(* 
    fn execute_instruction(
        pc: &mut u16,
        locals: &mut Locals,
        ty_args: &[Type],
        function: &Arc<Function>,
        resolver: &Resolver,
        interpreter: &mut Interpreter,
        gas_meter: &mut impl GasMeter,
        instruction: &Bytecode,
    ) -> PartialVMResult<InstrRet> {
        use SimpleInstruction as S;

        macro_rules! make_ty {
            ($ty: expr) => {
                TypeWithLoader {
                    ty: $ty,
                    loader: resolver.loader(),
                }
            };
        }

        match instruction {

            Bytecode::BrTrue(offset) => {
                gas_meter.charge_simple_instr(S::BrTrue)?;
                if interpreter.operand_stack.pop_as::<bool>()? {
                    *pc = *offset;
                    return Ok(InstrRet::Branch);
                }
            }
            Bytecode::BrFalse(offset) => {
                gas_meter.charge_simple_instr(S::BrFalse)?;
                if !interpreter.operand_stack.pop_as::<bool>()? {
                    *pc = *offset;
                    return Ok(InstrRet::Branch);
                }
            }
            Bytecode::Branch(offset) => {
                gas_meter.charge_simple_instr(S::Branch)?;
                *pc = *offset;
                return Ok(InstrRet::Branch);
            }
            Bytecode::LdU8(int_const) => {
                gas_meter.charge_simple_instr(S::LdU8)?;
                interpreter.operand_stack.push(Value::u8(*int_const))?; //*)
            }
            Bytecode::LdU16(int_const) => {
                gas_meter.charge_simple_instr(S::LdU16)?;
                interpreter.operand_stack.push(Value::u16(*int_const))?; //*)
            }
            Bytecode::LdU32(int_const) => {
                gas_meter.charge_simple_instr(S::LdU32)?;
                interpreter.operand_stack.push(Value::u32(*int_const))?; //*)
            }
            Bytecode::LdU64(int_const) => {
                gas_meter.charge_simple_instr(S::LdU64)?;
                interpreter.operand_stack.push(Value::u64(*int_const))?; //*)
            }
            Bytecode::LdU128(int_const) => {
                gas_meter.charge_simple_instr(S::LdU128)?;
                interpreter.operand_stack.push(Value::u128(**int_const))?; //*)
            }
            Bytecode::LdU256(int_const) => {
                gas_meter.charge_simple_instr(S::LdU256)?;
                interpreter.operand_stack.push(Value::u256(**int_const))?; //*)
            }
            Bytecode::LdConst(idx) => {
                let constant = resolver.constant_at(*idx); //*)
                gas_meter.charge_ld_const(NumBytes::new(constant.data.len() as u64))?;

                let val = Value::deserialize_constant(constant).ok_or_else(|| {
                    PartialVMError::new(StatusCode::VERIFIER_INVARIANT_VIOLATION).with_message(
                        "Verifier failed to verify the deserialization of constants".to_owned(),
                    )
                })?;

                gas_meter.charge_ld_const_after_deserialization(&val)?;

                interpreter.operand_stack.push(val)?
            }
            Bytecode::LdTrue => {
                gas_meter.charge_simple_instr(S::LdTrue)?;
                interpreter.operand_stack.push(Value::bool(true))?;
            }
            Bytecode::LdFalse => {
                gas_meter.charge_simple_instr(S::LdFalse)?;
                interpreter.operand_stack.push(Value::bool(false))?;
            }
            Bytecode::CopyLoc(idx) => {
                // TODO(Gas): We should charge gas before copying the value.
                let local = locals.copy_loc(*idx as usize)?; //*)
                gas_meter.charge_copy_loc(&local)?;
                interpreter.operand_stack.push(local)?;
            }
            Bytecode::MoveLoc(idx) => {
                let local = locals.move_loc(
                    *idx as usize,
                    resolver
                        .loader()
                        .vm_config()
                        .enable_invariant_violation_check_in_swap_loc,
                )?;
                gas_meter.charge_move_loc(&local)?;

                interpreter.operand_stack.push(local)?;
            }
            Bytecode::StLoc(idx) => {
                let value_to_store = interpreter.operand_stack.pop()?;
                gas_meter.charge_store_loc(&value_to_store)?;
                locals.store_loc(
                    *idx as usize,
                    value_to_store,
                    resolver
                        .loader()
                        .vm_config()
                        .enable_invariant_violation_check_in_swap_loc,
                )?;
            }
            Bytecode::Call(idx) => {
                return Ok(InstrRet::ExitCode(ExitCode::Call(*idx))); //*)
            }
            Bytecode::CallGeneric(idx) => {
                return Ok(InstrRet::ExitCode(ExitCode::CallGeneric(*idx))); //*)
            }
            Bytecode::MutBorrowLoc(idx) | Bytecode::ImmBorrowLoc(idx) => {
                let instr = match instruction {
                    Bytecode::MutBorrowLoc(_) => S::MutBorrowLoc,
                    _ => S::ImmBorrowLoc,
                };
                gas_meter.charge_simple_instr(instr)?;
                interpreter
                    .operand_stack
                    .push(locals.borrow_loc(*idx as usize)?)?; //*)
            }
            Bytecode::ImmBorrowField(fh_idx) | Bytecode::MutBorrowField(fh_idx) => {
                let instr = match instruction {
                    Bytecode::MutBorrowField(_) => S::MutBorrowField,
                    _ => S::ImmBorrowField,
                };
                gas_meter.charge_simple_instr(instr)?;

                let reference = interpreter.operand_stack.pop_as::<StructRef>()?;

                let offset = resolver.field_offset(*fh_idx); //*)
                let field_ref = reference.borrow_field(offset)?;
                interpreter.operand_stack.push(field_ref)?;
            }
            Bytecode::ImmBorrowFieldGeneric(fi_idx) | Bytecode::MutBorrowFieldGeneric(fi_idx) => {
                let instr = match instruction {
                    Bytecode::MutBorrowField(_) => S::MutBorrowFieldGeneric,
                    _ => S::ImmBorrowFieldGeneric,
                };
                gas_meter.charge_simple_instr(instr)?;

                let reference = interpreter.operand_stack.pop_as::<StructRef>()?;

                let offset = resolver.field_instantiation_offset(*fi_idx); //*)
                let field_ref = reference.borrow_field(offset)?;
                interpreter.operand_stack.push(field_ref)?;
            }
            Bytecode::Pack(sd_idx) => {
                let field_count = resolver.field_count(*sd_idx); //*)
                let struct_type = resolver.get_struct_type(*sd_idx); //*)
                Self::check_depth_of_type(resolver, &struct_type)?;
                gas_meter.charge_pack(
                    false,
                    interpreter.operand_stack.last_n(field_count as usize)?,
                )?;
                let args = interpreter.operand_stack.popn(field_count)?;
                interpreter
                    .operand_stack
                    .push(Value::struct_(Struct::pack(args)))?;
            }
            Bytecode::PackGeneric(si_idx) => {
                let field_count = resolver.field_instantiation_count(*si_idx); //*)
                let ty = resolver.instantiate_generic_type(*si_idx, ty_args)?; //*)
                Self::check_depth_of_type(resolver, &ty)?;
                gas_meter.charge_pack(
                    true,
                    interpreter.operand_stack.last_n(field_count as usize)?,
                )?;
                let args = interpreter.operand_stack.popn(field_count)?;
                interpreter
                    .operand_stack
                    .push(Value::struct_(Struct::pack(args)))?;
            }
            Bytecode::Unpack(_sd_idx) => {
                let struct_ = interpreter.operand_stack.pop_as::<Struct>()?;

                gas_meter.charge_unpack(false, struct_.field_views())?;

                for value in struct_.unpack()? {
                    interpreter.operand_stack.push(value)?;
                }
            }
            Bytecode::UnpackGeneric(_si_idx) => {
                let struct_ = interpreter.operand_stack.pop_as::<Struct>()?;

                gas_meter.charge_unpack(true, struct_.field_views())?;

                // TODO: Whether or not we want this gas metering in the loop is
                // questionable.  However, if we don't have it in the loop we could wind up
                // doing a fair bit of work before charging for it.
                for value in struct_.unpack()? {
                    interpreter.operand_stack.push(value)?;
                }
            }
            Bytecode::ReadRef => {
                let reference = interpreter.operand_stack.pop_as::<Reference>()?;
                gas_meter.charge_read_ref(reference.value_view())?;
                let value = reference.read_ref()?;
                interpreter.operand_stack.push(value)?;
            }
            Bytecode::WriteRef => {
                let reference = interpreter.operand_stack.pop_as::<Reference>()?;
                let value = interpreter.operand_stack.pop()?;
                gas_meter.charge_write_ref(&value, reference.value_view())?;
                reference.write_ref(value)?;
            }
            Bytecode::CastU8 => {
                gas_meter.charge_simple_instr(S::CastU8)?;
                let integer_value = interpreter.operand_stack.pop_as::<IntegerValue>()?;
                interpreter
                    .operand_stack
                    .push(Value::u8(integer_value.cast_u8()?))?;
            }
            Bytecode::CastU16 => {
                gas_meter.charge_simple_instr(S::CastU16)?;
                let integer_value = interpreter.operand_stack.pop_as::<IntegerValue>()?;
                interpreter
                    .operand_stack
                    .push(Value::u16(integer_value.cast_u16()?))?;
            }
            Bytecode::CastU32 => {
                gas_meter.charge_simple_instr(S::CastU16)?;
                let integer_value = interpreter.operand_stack.pop_as::<IntegerValue>()?;
                interpreter
                    .operand_stack
                    .push(Value::u32(integer_value.cast_u32()?))?;
            }
            Bytecode::CastU64 => {
                gas_meter.charge_simple_instr(S::CastU64)?;
                let integer_value = interpreter.operand_stack.pop_as::<IntegerValue>()?;
                interpreter
                    .operand_stack
                    .push(Value::u64(integer_value.cast_u64()?))?;
            }
            Bytecode::CastU128 => {
                gas_meter.charge_simple_instr(S::CastU128)?;
                let integer_value = interpreter.operand_stack.pop_as::<IntegerValue>()?;
                interpreter
                    .operand_stack
                    .push(Value::u128(integer_value.cast_u128()?))?;
            }
            Bytecode::CastU256 => {
                gas_meter.charge_simple_instr(S::CastU16)?;
                let integer_value = interpreter.operand_stack.pop_as::<IntegerValue>()?;
                interpreter
                    .operand_stack
                    .push(Value::u256(integer_value.cast_u256()?))?;
            }
            // Arithmetic Operations
            Bytecode::Add => {
                gas_meter.charge_simple_instr(S::Add)?;
                interpreter.binop_int(IntegerValue::add_checked)?
            }
            Bytecode::Sub => {
                gas_meter.charge_simple_instr(S::Sub)?;
                interpreter.binop_int(IntegerValue::sub_checked)?
            }
            Bytecode::Mul => {
                gas_meter.charge_simple_instr(S::Mul)?;
                interpreter.binop_int(IntegerValue::mul_checked)?
            }
            Bytecode::Mod => {
                gas_meter.charge_simple_instr(S::Mod)?;
                interpreter.binop_int(IntegerValue::rem_checked)?
            }
            Bytecode::Div => {
                gas_meter.charge_simple_instr(S::Div)?;
                interpreter.binop_int(IntegerValue::div_checked)?
            }
            Bytecode::BitOr => {
                gas_meter.charge_simple_instr(S::BitOr)?;
                interpreter.binop_int(IntegerValue::bit_or)?
            }
            Bytecode::BitAnd => {
                gas_meter.charge_simple_instr(S::BitAnd)?;
                interpreter.binop_int(IntegerValue::bit_and)?
            }
            Bytecode::Xor => {
                gas_meter.charge_simple_instr(S::Xor)?;
                interpreter.binop_int(IntegerValue::bit_xor)?
            }
            Bytecode::Shl => {
                gas_meter.charge_simple_instr(S::Shl)?;
                let rhs = interpreter.operand_stack.pop_as::<u8>()?;
                let lhs = interpreter.operand_stack.pop_as::<IntegerValue>()?;
                interpreter
                    .operand_stack
                    .push(lhs.shl_checked(rhs)?.into_value())?;
            }
            Bytecode::Shr => {
                gas_meter.charge_simple_instr(S::Shr)?;
                let rhs = interpreter.operand_stack.pop_as::<u8>()?;
                let lhs = interpreter.operand_stack.pop_as::<IntegerValue>()?;
                interpreter
                    .operand_stack
                    .push(lhs.shr_checked(rhs)?.into_value())?;
            }
            Bytecode::Or => {
                gas_meter.charge_simple_instr(S::Or)?;
                interpreter.binop_bool(|l, r| Ok(l || r))?
            }
            Bytecode::And => {
                gas_meter.charge_simple_instr(S::And)?;
                interpreter.binop_bool(|l, r| Ok(l && r))?
            }
            Bytecode::Lt => {
                gas_meter.charge_simple_instr(S::Lt)?;
                interpreter.binop_bool(IntegerValue::lt)?
            }
            Bytecode::Gt => {
                gas_meter.charge_simple_instr(S::Gt)?;
                interpreter.binop_bool(IntegerValue::gt)?
            }
            Bytecode::Le => {
                gas_meter.charge_simple_instr(S::Le)?;
                interpreter.binop_bool(IntegerValue::le)?
            }
            Bytecode::Ge => {
                gas_meter.charge_simple_instr(S::Ge)?;
                interpreter.binop_bool(IntegerValue::ge)?
            }
            Bytecode::Abort => {
                gas_meter.charge_simple_instr(S::Abort)?;
                let error_code = interpreter.operand_stack.pop_as::<u64>()?;
                let error = PartialVMError::new(StatusCode::ABORTED)
                    .with_sub_status(error_code)
                    .with_message(format!("{} at offset {}", function.pretty_string(), *pc,));
                return Err(error);
            }
            Bytecode::Eq => {
                let lhs = interpreter.operand_stack.pop()?;
                let rhs = interpreter.operand_stack.pop()?;
                gas_meter.charge_eq(&lhs, &rhs)?;
                interpreter
                    .operand_stack
                    .push(Value::bool(lhs.equals(&rhs)?))?;
            }
            Bytecode::Neq => {
                let lhs = interpreter.operand_stack.pop()?;
                let rhs = interpreter.operand_stack.pop()?;
                gas_meter.charge_neq(&lhs, &rhs)?;
                interpreter
                    .operand_stack
                    .push(Value::bool(!lhs.equals(&rhs)?))?;
            }
            Bytecode::MutBorrowGlobalDeprecated(_)
            | Bytecode::ImmBorrowGlobalDeprecated(_)
            | Bytecode::MutBorrowGlobalGenericDeprecated(_)
            | Bytecode::ImmBorrowGlobalGenericDeprecated(_)
            | Bytecode::ExistsDeprecated(_)
            | Bytecode::ExistsGenericDeprecated(_)
            | Bytecode::MoveFromDeprecated(_)
            | Bytecode::MoveFromGenericDeprecated(_)
            | Bytecode::MoveToDeprecated(_)
            | Bytecode::MoveToGenericDeprecated(_) => {
                unreachable!("Global bytecodes deprecated")
            }
            Bytecode::FreezeRef => {
                gas_meter.charge_simple_instr(S::FreezeRef)?;
                // FreezeRef should just be a null op as we don't distinguish between mut
                // and immut ref at runtime.
            }
            Bytecode::Not => {
                gas_meter.charge_simple_instr(S::Not)?;
                let value = !interpreter.operand_stack.pop_as::<bool>()?;
                interpreter.operand_stack.push(Value::bool(value))?;
            }
            Bytecode::Nop => {
                gas_meter.charge_simple_instr(S::Nop)?;
            }
            Bytecode::VecPack(si, num) => {
                let ty = resolver.instantiate_single_type(*si, ty_args)?; //*)
                Self::check_depth_of_type(resolver, &ty)?;
                gas_meter.charge_vec_pack(
                    make_ty!(&ty),
                    interpreter.operand_stack.last_n(*num as usize)?, //*)
                )?;
                let elements = interpreter.operand_stack.popn(*num as u16)?; //*)
                let value = Vector::pack(&ty, elements)?;
                interpreter.operand_stack.push(value)?;
            }
            Bytecode::VecLen(si) => {
                let vec_ref = interpreter.operand_stack.pop_as::<VectorRef>()?;
                let ty = &resolver.instantiate_single_type(*si, ty_args)?; //*)
                gas_meter.charge_vec_len(TypeWithLoader {
                    ty,
                    loader: resolver.loader(),
                })?;
                let value = vec_ref.len(ty)?;
                interpreter.operand_stack.push(value)?;
            }
            Bytecode::VecImmBorrow(si) => {
                let idx = interpreter.operand_stack.pop_as::<u64>()? as usize;
                let vec_ref = interpreter.operand_stack.pop_as::<VectorRef>()?;
                let ty = resolver.instantiate_single_type(*si, ty_args)?; //*)
                let res = vec_ref.borrow_elem(idx, &ty);
                gas_meter.charge_vec_borrow(false, make_ty!(&ty), res.is_ok())?;
                interpreter.operand_stack.push(res?)?;
            }
            Bytecode::VecMutBorrow(si) => {
                let idx = interpreter.operand_stack.pop_as::<u64>()? as usize;
                let vec_ref = interpreter.operand_stack.pop_as::<VectorRef>()?;
                let ty = &resolver.instantiate_single_type(*si, ty_args)?; //*)
                let res = vec_ref.borrow_elem(idx, ty);
                gas_meter.charge_vec_borrow(true, make_ty!(ty), res.is_ok())?;
                interpreter.operand_stack.push(res?)?;
            }
            Bytecode::VecPushBack(si) => {
                let elem = interpreter.operand_stack.pop()?;
                let vec_ref = interpreter.operand_stack.pop_as::<VectorRef>()?;
                let ty = &resolver.instantiate_single_type(*si, ty_args)?; //*)
                gas_meter.charge_vec_push_back(make_ty!(ty), &elem)?;
                vec_ref.push_back(elem, ty, interpreter.runtime_limits_config().vector_len_max)?;
            }
            Bytecode::VecPopBack(si) => {
                let vec_ref = interpreter.operand_stack.pop_as::<VectorRef>()?;
                let ty = &resolver.instantiate_single_type(*si, ty_args)?; //*)
                let res = vec_ref.pop(ty);
                gas_meter.charge_vec_pop_back(make_ty!(ty), res.as_ref().ok())?;
                interpreter.operand_stack.push(res?)?;
            }
            Bytecode::VecUnpack(si, num) => {
                let vec_val = interpreter.operand_stack.pop_as::<Vector>()?;
                let ty = &resolver.instantiate_single_type(*si, ty_args)?; //*)
                gas_meter.charge_vec_unpack(
                    make_ty!(ty),
                    NumArgs::new(*num), //*)
                    vec_val.elem_views(),
                )?;
                let elements = vec_val.unpack(ty, *num)?;
                for value in elements {
                    interpreter.operand_stack.push(value)?;
                }
            }
            Bytecode::VecSwap(si) => {
                let idx2 = interpreter.operand_stack.pop_as::<u64>()? as usize;
                let idx1 = interpreter.operand_stack.pop_as::<u64>()? as usize;
                let vec_ref = interpreter.operand_stack.pop_as::<VectorRef>()?;
                let ty = &resolver.instantiate_single_type(*si, ty_args)?; //*)
                gas_meter.charge_vec_swap(make_ty!(ty))?;
                vec_ref.swap(idx1, idx2, ty)?;
            }
        }

        Ok(InstrRet::Ok)
    }
*)

(* NOTE: State designed for `execute_instruction` *)
Definition State := (Z * Locals.t * Interpreter.t).

(* NOTE: This function is for debugging purpose *)
Definition debug_execute_instruction (pc : Z) 
  (locals : Locals.t) (ty_args : list _Type.t)
  (function : Function.t) (resolver : Resolver.t)
  (interpreter : Interpreter.t) (* (gas_meter : GasMeter.t) *) (* NOTE: We ignore gas since it's never implemented *)
  (instruction : Bytecode.t)
  : MS? State string (PartialVMResult.t InstrRet.t) :=
  match instruction with
  (* fill debugging content here *)
  (* 
  Bytecode::Pop => {
    let popped_val = interpreter.operand_stack.pop()?;
    gas_meter.charge_pop(popped_val)?;
  }
  *)
  | Bytecode.Pop => returnS? $ Result.Ok InstrRet.Ok



  | _ => returnS? $ Result.Ok InstrRet.Ok
  end.

(* NOTE: this function is of `impl Frame` (but doesn't involve `Frame` item?) *)
Definition execute_instruction (pc : Z) 
  (locals : Locals.t) (ty_args : list _Type.t)
  (function : Function.t) (resolver : Resolver.t)
  (interpreter : Interpreter.t) (* (gas_meter : GasMeter.t) *) (* NOTE: We ignore gas since it's never implemented *)
  (instruction : Bytecode.t)
  : MS? State string (PartialVMResult.t InstrRet.t) :=
  letS? '(pc, locals, interpreter) := readS? in
  match instruction with
  (* 
  Bytecode::Pop => {
    let popped_val = interpreter.operand_stack.pop()?;
    gas_meter.charge_pop(popped_val)?;
  }
  *)

  (* 
  Bytecode::Ret => {
    gas_meter.charge_simple_instr(S::Ret)?;
    return Ok(InstrRet::ExitCode(ExitCode::Return));
  }
  *)
  | _ => returnS? $ Result.Ok InstrRet.Ok
  end.
