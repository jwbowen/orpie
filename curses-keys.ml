(*  Orpie -- a stack-based RPN calculator for the console
 *  Copyright (C) 2003-2004  Paul Pelzl
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 *  Please send bug reports, patches, etc. to Paul Pelzl at 
 *  <pelzlpj@eecs.umich.edu>.
 *)

open Curses;;


begin
   let std = initscr () in
   assert (keypad std true);
   assert (cbreak ());
   assert (noecho ());
   assert (curs_set 0);
   assert (mvaddstr 1 0 "Type some keys to see the corresponding octal and string representations:");
   assert (refresh ())
end;
while true do
   let k = getch () in
   let s1 = Printf.sprintf " octal: \\%.3o" k and
   s2 = Printf.sprintf     "string: \"%s\"" (Utility.string_of_chtype k) in
   (assert (move 2 0);
   clrtoeol ();
   assert (addstr s1);
   assert (move 3 0);
   clrtoeol ();
   assert (addstr s2);
   assert (refresh ()))
done;
endwin ();;




(* arch-tag: DO_NOT_CHANGE_31cbf03e-49f9-4f66-844c-ceb584edb920 *)
