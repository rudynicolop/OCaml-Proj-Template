open Core

module type Stack = sig
  (** Representation type. *)
  type 'a t

  (** The empty stack. *)
  val empty : 'a t

  (** Pushing onto a stack. *)
  val push : 'a t -> elem:'a -> 'a t

  (** Popping off a stack. *)
  val pop : 'a t -> 'a option * 'a t

  (** Mapping over a stack. *)
  val smap : 'a t -> f:('a -> 'b) -> 'b t

  (** (Right-associative) Folding over a stack. *)
  val sfold : 'a t -> f:('a -> 'b -> 'b) -> init:'b -> 'b

  (** Iterating over a stack. *)
  val siter : 'a t -> f:('a -> unit) -> unit
end

module ListStack : Stack = struct
  type 'a t = 'a list

  let empty : 'a list = []

  let push stk ~elem:a = a :: stk

  let pop : 'a list -> 'a option * 'a list = function
    | [] -> None, []
    | pop::stk -> Some pop, stk

  let smap stk ~f:f = List.map ~f:f stk

  let sfold stk ~f:f ~init:acc = List.fold_right ~f:f ~init:acc stk

  let siter stk ~f:f = List.iter ~f:f stk
end
