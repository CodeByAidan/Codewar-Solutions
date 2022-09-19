(*  ----------------------------------------------------- *)
(*  -*- coding:utf-8 -*-                                  *)
(*  author       : livxy                                  *)
(*  description  : solutions for codewars.com             *)
(*  updated at   : 2022-&m-&d 21:49                       *)
(*  ----------------------------------------------------- *)
(*  Kata UUID    : 594ecda58e7871156c00006f               *)
(*  Title        : Sloth                                  *)
(*  Kyu          : 1 kyu                                  *)
(*  Kata's Sensi : lolisa                                 *)
(*  Tags         : ['Functional Programming', 'Fundamentals']*)
(*  Vote Score   : 25                                     *)
(*  Total Stars  : 19                                     *)
(*  Solved       : 36/689                                 *)
(*  Language     : Ocaml                                  *)
(*  ----------------------------------------------------- *)

module type Lazy =
sig
  type _ t
  val mk: (unit -> 'a) -> 'a t
  val get: 'a t -> 'a
  val map: ('a -> 'b) -> 'a t -> 'b t
  val return: 'a -> 'a t
  val join: 'a t t -> 'a t
  val bind:  ('a -> 'b t) -> 'a t -> 'b t
  val (>>=): 'a t -> ('a -> 'b t) -> 'b t
  val tie: ('a t -> 'a t) -> 'a t
end;;
 
module type LazyMin =
sig
  type _ t
  val mk: (unit -> 'a) -> 'a t
  val get: 'a t -> 'a
end;;
 
module LazyImpl (LM: LazyMin): Lazy with type 'a t = 'a LM.t =
struct
  include LM
  let map f a = mk (fun _ -> f (get a))
  let return a = mk (fun _ -> a)
  let join a = mk (fun _ -> get (get a))
  let bind m a = join (map m a)
  let (>>=) a m = bind m a
  let tie f =
    let tem = ref (mk (fun _ -> failwith "uninitialize")) in
      tem := mk (fun _ -> get (f (!tem))); !tem
end;;
 
module LazyThunk: Lazy with type 'a t = unit -> 'a = LazyImpl(
struct
  type 'a t = unit -> 'a
  let mk f = f
  let get f = f ()
end);;
 
(* caching the result only if it's not empty *)
module LazyOption:
  Lazy with type 'a t = 'a option ref * (unit -> 'a) = LazyImpl(
struct
  type 'a t = 'a option ref * (unit -> 'a)
  let mk f = (ref None, f)
  let get (o, f) =
    match !o with
      None -> let ret = f () in o := Some ret; ret
    | Some x -> x
end);;
 
(* Caching Tagless *)
module LazyTagless: Lazy with type 'a t = (unit -> 'a) ref = LazyImpl(
struct
  type 'a t = (unit -> 'a) ref
  let mk = ref
  let get x = let ret = (!x)() in x := (fun _ -> ret); ret
end);;

(* infinite stream time *)
module type StreamSig =
sig
  module L: Lazy
  type 'a stream = Stream of ('a * 'a stream) L.t
  val mk: (unit -> 'a * 'a stream) -> 'a stream
  val hd: 'a stream -> 'a
  val tl: 'a stream -> 'a stream
  val gen: ('a -> 'a) -> 'a L.t -> 'a stream
  val map: ('a -> 'b) -> 'a stream -> 'b stream
  val zip: 'a stream -> 'b stream -> ('a * 'b) stream
  val zipWith: ('a * 'b -> 'c) -> 'a stream -> 'b stream -> 'c stream
  val takeWhile: ('a -> bool) -> 'a stream -> 'a list
  val app: 'a list -> 'a stream -> 'a stream
  val fib_aux: int stream -> int stream 
  val join: 'a stream stream -> 'a stream
end;;
 
module Stream (L: Lazy): StreamSig with module L = L =
struct
  module L = L
  type 'a stream = Stream of ('a * 'a stream) L.t
  let rec mk f = Stream (L.mk f)
  let hd (Stream x) = fst (L.get x)
  let tl (Stream x) = mk (fun _ ->
    match snd (L.get x) with Stream s -> L.get s)
  let rec gen f a = mk (fun _ ->
    (L.get a, gen f (L.mk (fun _ -> f (L.get a)))))
  let rec map f x = mk (fun _ -> (f (hd x), map f (tl x)))
  let rec zip l r = mk (fun _ -> ((hd l, hd r), zip (tl l) (tl r)))
  let zipWith f l r = map f (zip l r)
  let rec takeWhile p x = if p (hd x) then hd x :: takeWhile p (tl x) else []
  let rec app = function
    [] -> (fun x -> x)
  | (a :: ax) -> (fun x -> mk (fun _ -> (a, (app ax x))))
  let fib_aux self =
    app [0; 1] (zipWith (fun (l, r) -> l + r) self (tl self))
  let join ss =
    let rec fold l s =
      mk (fun () -> L.get (match (app (List.map hd l) (fold (hd s :: List.map tl l) (tl s))) with
        Stream s -> s)) 
    in fold [] ss
end;;
