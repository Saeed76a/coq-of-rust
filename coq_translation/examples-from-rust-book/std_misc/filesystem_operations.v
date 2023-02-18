(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

(* Approximation *)

Definition u8 : Set := Z.
Definition u16 : Set := Z.
Definition u32 : Set := Z.
Definition u64 : Set := Z.
Definition u128 : Set := Z.

Definition i8 : Set := Z.
Definition i16 : Set := Z.
Definition i32 : Set := Z.
Definition i64 : Set := Z.
Definition i128 : Set := Z.

Definition f32 : Set := Z.
Definition f64 : Set := Z.

Definition cat (_ : unit) :=
  let f := match branch (ImplFile.open path) with
  | {| Break.0 := residual; |} => Return (from_residual residual)
  | {| Continue.0 := val; |} => val
  end in
  let s := ImplString.new tt in
  match read_to_string f s with
  | Ok (_) => Ok s
  | Err (e) => Err e
  end.

Definition echo (_ : unit) :=
  let f := match branch (ImplFile.create path) with
  | {| Break.0 := residual; |} => Return (from_residual residual)
  | {| Continue.0 := val; |} => val
  end in
  write_all f (as_bytes s).

Definition touch (_ : unit) :=
  match open (write (create (ImplOpenOptions.new tt) true) true) path with
  | Ok (_) => Ok ()
  | Err (e) => Err e
  end.

Definition main (_ : unit) :=
  _crate.io._print (_crate::fmt::ImplArguments.new_v1 ["`mkdir a`\n"] []) ;;
  tt ;;
  match fs.create_dir "a" with
  | Err (why) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["! ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_debug (kind why)]) ;;
    tt
  | Ok (_) => tt
  end ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["`echo hello > a/b.txt`\n"] []) ;;
  tt ;;
  unwrap_or_else
    (echo "hello" (ImplPath.new "a/b.txt"))
    (fun why => _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["! ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_debug (kind why)]) ;;
    tt ;;
    tt) ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["`mkdir -p a/c/d`\n"] []) ;;
  tt ;;
  unwrap_or_else
    (fs.create_dir_all "a/c/d")
    (fun why => _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["! ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_debug (kind why)]) ;;
    tt ;;
    tt) ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["`touch a/c/e.txt`\n"] []) ;;
  tt ;;
  unwrap_or_else
    (touch (ImplPath.new "a/c/e.txt"))
    (fun why => _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["! ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_debug (kind why)]) ;;
    tt ;;
    tt) ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["`ln -s ../b.txt a/c/b.txt`\n"] []) ;;
  tt ;;
  if true then
    unwrap_or_else
      (unix.fs.symlink "../b.txt" "a/c/b.txt")
      (fun why => _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["! ";"\n"]
          [_crate::fmt::ImplArgumentV1.new_debug (kind why)]) ;;
      tt ;;
      tt) ;;
    tt
  else
    tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["`cat a/c/b.txt`\n"] []) ;;
  tt ;;
  match cat (ImplPath.new "a/c/b.txt") with
  | Err (why) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["! ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_debug (kind why)]) ;;
    tt
  | Ok (s) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["> ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_display s]) ;;
    tt
  end ;;
  _crate.io._print (_crate::fmt::ImplArguments.new_v1 ["`ls a`\n"] []) ;;
  tt ;;
  match fs.read_dir "a" with
  | Err (why) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["! ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_debug (kind why)]) ;;
    tt
  | Ok (paths) =>
    match into_iter paths with
    | iter =>
      loop match next iter with
      | {|  |} => Break
      | {| Some.0 := path; |} =>
        _crate.io._print
          (_crate::fmt::ImplArguments.new_v1
            ["> ";"\n"]
            [_crate::fmt::ImplArgumentV1.new_debug (path (unwrap path))]) ;;
        tt ;;
        tt
      end ;;
      tt from for
    end
  end ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["`rm a/c/e.txt`\n"] []) ;;
  tt ;;
  unwrap_or_else
    (fs.remove_file "a/c/e.txt")
    (fun why => _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["! ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_debug (kind why)]) ;;
    tt ;;
    tt) ;;
  _crate.io._print (_crate::fmt::ImplArguments.new_v1 ["`rmdir a/c/d`\n"] []) ;;
  tt ;;
  unwrap_or_else
    (fs.remove_dir "a/c/d")
    (fun why => _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["! ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_debug (kind why)]) ;;
    tt ;;
    tt) ;;
  tt.