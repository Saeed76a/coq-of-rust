(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module ptr.
  Module metadata.
    (* Trait *)
    (* Empty module 'Pointee' *)
    
    (* Error TraitAlias *)
    
    (*
    pub const fn metadata<T: ?Sized>(ptr: *const T) -> <T as Pointee>::Metadata {
        // SAFETY: Accessing the value from the `PtrRepr` union is safe since *const T
        // and PtrComponents<T> have the same memory layouts. Only std can make this
        // guarantee.
        unsafe { PtrRepr { const_ptr: ptr }.components.metadata }
    }
    *)
    Definition metadata (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ T ], [ ptr ] =>
        ltac:(M.monadic
          (let ptr := M.alloc (| ptr |) in
          M.read (|
            M.SubPointer.get_struct_record_field (|
              M.SubPointer.get_struct_record_field (|
                M.alloc (|
                  Value.StructRecord
                    "core::ptr::metadata::PtrRepr"
                    [ ("const_ptr", M.read (| ptr |)) ]
                |),
                "core::ptr::metadata::PtrRepr",
                "components"
              |),
              "core::ptr::metadata::PtrComponents",
              "metadata"
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    (*
    pub const fn from_raw_parts<T: ?Sized>(
        data_address: *const (),
        metadata: <T as Pointee>::Metadata,
    ) -> *const T {
        // SAFETY: Accessing the value from the `PtrRepr` union is safe since *const T
        // and PtrComponents<T> have the same memory layouts. Only std can make this
        // guarantee.
        unsafe { PtrRepr { components: PtrComponents { data_address, metadata } }.const_ptr }
    }
    *)
    Definition from_raw_parts (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ T ], [ data_address; metadata ] =>
        ltac:(M.monadic
          (let data_address := M.alloc (| data_address |) in
          let metadata := M.alloc (| metadata |) in
          M.read (|
            M.SubPointer.get_struct_record_field (|
              M.alloc (|
                Value.StructRecord
                  "core::ptr::metadata::PtrRepr"
                  [
                    ("components",
                      Value.StructRecord
                        "core::ptr::metadata::PtrComponents"
                        [
                          ("data_address", M.read (| data_address |));
                          ("metadata", M.read (| metadata |))
                        ])
                  ]
              |),
              "core::ptr::metadata::PtrRepr",
              "const_ptr"
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    (*
    pub const fn from_raw_parts_mut<T: ?Sized>(
        data_address: *mut (),
        metadata: <T as Pointee>::Metadata,
    ) -> *mut T {
        // SAFETY: Accessing the value from the `PtrRepr` union is safe since *const T
        // and PtrComponents<T> have the same memory layouts. Only std can make this
        // guarantee.
        unsafe { PtrRepr { components: PtrComponents { data_address, metadata } }.mut_ptr }
    }
    *)
    Definition from_raw_parts_mut (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ T ], [ data_address; metadata ] =>
        ltac:(M.monadic
          (let data_address := M.alloc (| data_address |) in
          let metadata := M.alloc (| metadata |) in
          M.read (|
            M.SubPointer.get_struct_record_field (|
              M.alloc (|
                Value.StructRecord
                  "core::ptr::metadata::PtrRepr"
                  [
                    ("components",
                      Value.StructRecord
                        "core::ptr::metadata::PtrComponents"
                        [
                          ("data_address",
                            (* MutToConstPointer *) M.pointer_coercion (M.read (| data_address |)));
                          ("metadata", M.read (| metadata |))
                        ])
                  ]
              |),
              "core::ptr::metadata::PtrRepr",
              "mut_ptr"
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    (* Error Union *)
    
    (* StructRecord
      {
        name := "PtrComponents";
        ty_params := [ "T" ];
        fields :=
          [
            ("data_address", Ty.apply (Ty.path "*const") [ Ty.tuple [] ]);
            ("metadata", Ty.associated)
          ];
      } *)
    
    Module Impl_core_marker_Copy_where_core_marker_Sized_T_for_core_ptr_metadata_PtrComponents_T.
      Definition Self (T : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::PtrComponents") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::marker::Copy"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Copy_where_core_marker_Sized_T_for_core_ptr_metadata_PtrComponents_T.
    
    Module Impl_core_clone_Clone_where_core_marker_Sized_T_for_core_ptr_metadata_PtrComponents_T.
      Definition Self (T : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::PtrComponents") [ T ].
      
      (*
          fn clone(&self) -> Self {
              *self
          }
      *)
      Definition clone (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::clone::Clone"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method (clone T)) ].
    End Impl_core_clone_Clone_where_core_marker_Sized_T_for_core_ptr_metadata_PtrComponents_T.
    
    (* StructRecord
      {
        name := "DynMetadata";
        ty_params := [ "Dyn" ];
        fields :=
          [
            ("vtable_ptr", Ty.apply (Ty.path "&") [ Ty.path "core::ptr::metadata::VTable" ]);
            ("phantom", Ty.apply (Ty.path "core::marker::PhantomData") [ Dyn ])
          ];
      } *)
    
    (* Unhandled foreign module here *)
    
    Module Impl_core_ptr_metadata_DynMetadata_Dyn.
      Definition Self (Dyn : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ].
      
      (*
          pub fn size_of(self) -> usize {
              // Note that "size stored in vtable" is *not* the same as "result of size_of_val_raw".
              // Consider a reference like `&(i32, dyn Send)`: the vtable will only store the size of the
              // `Send` part!
              // SAFETY: DynMetadata always contains a valid vtable pointer
              return unsafe {
                  crate::intrinsics::vtable_size(self.vtable_ptr as *const VTable as *const ())
              };
          }
      *)
      Definition size_of (Dyn : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self Dyn in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.catch_return (|
              ltac:(M.monadic
                (M.never_to_any (|
                  M.read (|
                    M.return_ (|
                      M.call_closure (|
                        M.get_function (| "core::intrinsics::vtable_size", [] |),
                        [
                          M.rust_cast
                            (M.read (|
                              M.use
                                (M.alloc (|
                                  M.read (|
                                    M.SubPointer.get_struct_record_field (|
                                      self,
                                      "core::ptr::metadata::DynMetadata",
                                      "vtable_ptr"
                                    |)
                                  |)
                                |))
                            |))
                        ]
                      |)
                    |)
                  |)
                |)))
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_size_of :
        forall (Dyn : Ty.t),
        M.IsAssociatedFunction (Self Dyn) "size_of" (size_of Dyn).
      
      (*
          pub fn align_of(self) -> usize {
              // SAFETY: DynMetadata always contains a valid vtable pointer
              return unsafe {
                  crate::intrinsics::vtable_align(self.vtable_ptr as *const VTable as *const ())
              };
          }
      *)
      Definition align_of (Dyn : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self Dyn in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.catch_return (|
              ltac:(M.monadic
                (M.never_to_any (|
                  M.read (|
                    M.return_ (|
                      M.call_closure (|
                        M.get_function (| "core::intrinsics::vtable_align", [] |),
                        [
                          M.rust_cast
                            (M.read (|
                              M.use
                                (M.alloc (|
                                  M.read (|
                                    M.SubPointer.get_struct_record_field (|
                                      self,
                                      "core::ptr::metadata::DynMetadata",
                                      "vtable_ptr"
                                    |)
                                  |)
                                |))
                            |))
                        ]
                      |)
                    |)
                  |)
                |)))
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_align_of :
        forall (Dyn : Ty.t),
        M.IsAssociatedFunction (Self Dyn) "align_of" (align_of Dyn).
      
      (*
          pub fn layout(self) -> crate::alloc::Layout {
              // SAFETY: the compiler emitted this vtable for a concrete Rust type which
              // is known to have a valid layout. Same rationale as in `Layout::for_value`.
              unsafe { crate::alloc::Layout::from_size_align_unchecked(self.size_of(), self.align_of()) }
          }
      *)
      Definition layout (Dyn : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self Dyn in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "core::alloc::layout::Layout",
                "from_size_align_unchecked",
                []
              |),
              [
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ],
                    "size_of",
                    []
                  |),
                  [ M.read (| self |) ]
                |);
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ],
                    "align_of",
                    []
                  |),
                  [ M.read (| self |) ]
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_layout :
        forall (Dyn : Ty.t),
        M.IsAssociatedFunction (Self Dyn) "layout" (layout Dyn).
    End Impl_core_ptr_metadata_DynMetadata_Dyn.
    
    Module Impl_core_marker_Send_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
      Definition Self (Dyn : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ].
      
      Axiom Implements :
        forall (Dyn : Ty.t),
        M.IsTraitInstance
          "core::marker::Send"
          (Self Dyn)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Send_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
    
    Module Impl_core_marker_Sync_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
      Definition Self (Dyn : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ].
      
      Axiom Implements :
        forall (Dyn : Ty.t),
        M.IsTraitInstance
          "core::marker::Sync"
          (Self Dyn)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Sync_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
    
    Module Impl_core_fmt_Debug_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
      Definition Self (Dyn : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ].
      
      (*
          fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
              f.debug_tuple("DynMetadata").field(&(self.vtable_ptr as *const VTable)).finish()
          }
      *)
      Definition fmt (Dyn : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self Dyn in
        match τ, α with
        | [], [ self; f ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let f := M.alloc (| f |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "core::fmt::builders::DebugTuple",
                "finish",
                []
              |),
              [
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "core::fmt::builders::DebugTuple",
                    "field",
                    []
                  |),
                  [
                    M.alloc (|
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.path "core::fmt::Formatter",
                          "debug_tuple",
                          []
                        |),
                        [ M.read (| f |); M.read (| Value.String "DynMetadata" |) ]
                      |)
                    |);
                    (* Unsize *)
                    M.pointer_coercion
                      (M.use
                        (M.alloc (|
                          M.read (|
                            M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "core::ptr::metadata::DynMetadata",
                              "vtable_ptr"
                            |)
                          |)
                        |)))
                  ]
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (Dyn : Ty.t),
        M.IsTraitInstance
          "core::fmt::Debug"
          (Self Dyn)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("fmt", InstanceField.Method (fmt Dyn)) ].
    End Impl_core_fmt_Debug_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
    
    Module Impl_core_marker_Unpin_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
      Definition Self (Dyn : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ].
      
      Axiom Implements :
        forall (Dyn : Ty.t),
        M.IsTraitInstance
          "core::marker::Unpin"
          (Self Dyn)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Unpin_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
    
    Module Impl_core_marker_Copy_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
      Definition Self (Dyn : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ].
      
      Axiom Implements :
        forall (Dyn : Ty.t),
        M.IsTraitInstance
          "core::marker::Copy"
          (Self Dyn)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Copy_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
    
    Module Impl_core_clone_Clone_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
      Definition Self (Dyn : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ].
      
      (*
          fn clone(&self) -> Self {
              *self
          }
      *)
      Definition clone (Dyn : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self Dyn in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (Dyn : Ty.t),
        M.IsTraitInstance
          "core::clone::Clone"
          (Self Dyn)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method (clone Dyn)) ].
    End Impl_core_clone_Clone_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
    
    Module Impl_core_cmp_Eq_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
      Definition Self (Dyn : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ].
      
      Axiom Implements :
        forall (Dyn : Ty.t),
        M.IsTraitInstance
          "core::cmp::Eq"
          (Self Dyn)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_cmp_Eq_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
    
    Module Impl_core_cmp_PartialEq_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
      Definition Self (Dyn : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ].
      
      (*
          fn eq(&self, other: &Self) -> bool {
              crate::ptr::eq::<VTable>(self.vtable_ptr, other.vtable_ptr)
          }
      *)
      Definition eq (Dyn : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self Dyn in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.call_closure (|
              M.get_function (| "core::ptr::eq", [ Ty.path "core::ptr::metadata::VTable" ] |),
              [
                M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::ptr::metadata::DynMetadata",
                    "vtable_ptr"
                  |)
                |);
                M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| other |),
                    "core::ptr::metadata::DynMetadata",
                    "vtable_ptr"
                  |)
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (Dyn : Ty.t),
        M.IsTraitInstance
          "core::cmp::PartialEq"
          (Self Dyn)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("eq", InstanceField.Method (eq Dyn)) ].
    End Impl_core_cmp_PartialEq_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
    
    Module Impl_core_cmp_Ord_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
      Definition Self (Dyn : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ].
      
      (*
          fn cmp(&self, other: &Self) -> crate::cmp::Ordering {
              (self.vtable_ptr as *const VTable).cmp(&(other.vtable_ptr as *const VTable))
          }
      *)
      Definition cmp (Dyn : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self Dyn in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::cmp::Ord",
                Ty.apply (Ty.path "*const") [ Ty.path "core::ptr::metadata::VTable" ],
                [],
                "cmp",
                []
              |),
              [
                M.use
                  (M.alloc (|
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::ptr::metadata::DynMetadata",
                        "vtable_ptr"
                      |)
                    |)
                  |));
                M.use
                  (M.alloc (|
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| other |),
                        "core::ptr::metadata::DynMetadata",
                        "vtable_ptr"
                      |)
                    |)
                  |))
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (Dyn : Ty.t),
        M.IsTraitInstance
          "core::cmp::Ord"
          (Self Dyn)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("cmp", InstanceField.Method (cmp Dyn)) ].
    End Impl_core_cmp_Ord_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
    
    Module Impl_core_cmp_PartialOrd_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
      Definition Self (Dyn : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ].
      
      (*
          fn partial_cmp(&self, other: &Self) -> Option<crate::cmp::Ordering> {
              Some(self.cmp(other))
          }
      *)
      Definition partial_cmp (Dyn : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self Dyn in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            Value.StructTuple
              "core::option::Option::Some"
              [
                M.call_closure (|
                  M.get_trait_method (|
                    "core::cmp::Ord",
                    Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ],
                    [],
                    "cmp",
                    []
                  |),
                  [ M.read (| self |); M.read (| other |) ]
                |)
              ]))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (Dyn : Ty.t),
        M.IsTraitInstance
          "core::cmp::PartialOrd"
          (Self Dyn)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("partial_cmp", InstanceField.Method (partial_cmp Dyn)) ].
    End Impl_core_cmp_PartialOrd_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
    
    Module Impl_core_hash_Hash_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
      Definition Self (Dyn : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::ptr::metadata::DynMetadata") [ Dyn ].
      
      (*
          fn hash<H: Hasher>(&self, hasher: &mut H) {
              crate::ptr::hash::<VTable, _>(self.vtable_ptr, hasher)
          }
      *)
      Definition hash (Dyn : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self Dyn in
        match τ, α with
        | [ H ], [ self; hasher ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let hasher := M.alloc (| hasher |) in
            M.call_closure (|
              M.get_function (| "core::ptr::hash", [ Ty.path "core::ptr::metadata::VTable"; H ] |),
              [
                M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::ptr::metadata::DynMetadata",
                    "vtable_ptr"
                  |)
                |);
                M.read (| hasher |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (Dyn : Ty.t),
        M.IsTraitInstance
          "core::hash::Hash"
          (Self Dyn)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("hash", InstanceField.Method (hash Dyn)) ].
    End Impl_core_hash_Hash_where_core_marker_Sized_Dyn_for_core_ptr_metadata_DynMetadata_Dyn.
  End metadata.
End ptr.