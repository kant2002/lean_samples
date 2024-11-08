-- This example shows how to define a new structure type.
structure ContactCard where
  Name     : String
  Phone    : String
  Verified : Bool

-- This example shows how to instantiate a structure type.
-- Each field can optionally be separated using ','.
-- Notice that you should hint Lean with target type
def contact1 : ContactCard := {
  Name := "Alf"
  Phone := "(206) 555-0157"
  Verified := false }

-- This is simplified construction form.
def contact1_1 : ContactCard := ⟨"Alf", "(206) 555-0157", false⟩

-- You can also do this on the same line with ',' separators.
def contactOnSameLine : ContactCard := { Name := "Alf", Phone := "(206) 555-0157", Verified := false }

-- This example shows how to use "copy-and-update" on record values. It creates
-- a new record value that is a copy of contact1, but has different values for
-- the 'Phone' and 'Verified' fields.
def contact2 :=
  { contact1 with
      Phone := "(206) 555-0112"
      Verified := true }

-- This example shows how to write a function that processes a record value.
-- It converts a 'ContactCard' object to a string.
def showContactCard (c: ContactCard) :=
    c.Name ++ " Phone: " ++ c.Phone ++ (if not c.Verified then " (unverified)" else "")

-- This is an example of a Record with a member.
structure ContactCardAlternate where
  Name     : String
  Phone    : String
  Address  : String
  Verified : Bool

-- Members can implement *object-oriented* members.
-- That's obviously a lie, since there no objects in lean.
-- Lean just treat `val.fun` as `fun val`
def ContactCardAlternate.PrintedContactCard (this : ContactCardAlternate)  :=
    this.Name ++ " Phone: " ++ this.Phone ++ (if not this.Verified then " (unverified)" else "") ++ this.Address

def contactAlternate : ContactCardAlternate := {
  Name := "Alf"
  Phone := "(206) 555-0157"
  Verified := false
  Address := "111 Alf Street" }
