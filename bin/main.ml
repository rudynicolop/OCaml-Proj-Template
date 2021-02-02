open Core

(** Great joke, I know. *)
open Libra.Sesame
module LS = ListStack

(** Replace the code in this file with whatever
    you desire your "main" to include. *)

let stk =
  LS.empty
  |> LS.push ~elem:3
  |> LS.push ~elem:69
  |> LS.push ~elem:42
  |> LS.push ~elem:666
  |> LS.push ~elem:70
  |> LS.push ~elem:9001

let _ =
  print_endline "Elements:";
  stk
  |> LS.smap ~f:Int.to_string
  |> LS.siter ~f:print_endline

let _ =
  print_endline "Sum:";
  stk
  |> LS.sfold ~f:(+) ~init:0
  |> Int.to_string
  |> print_endline

let _ =
  print_endline "Popping element:";
  let open Option in
  stk
  |> LS.pop
  |> fst >>|
  begin fun elem ->
    elem
    |> Int.to_string
    |> print_endline
  end
