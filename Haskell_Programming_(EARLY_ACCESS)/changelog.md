# Errata

If you see us mention a release that isn't out yet - it's coming.

## Errors fixed v0.1 -> v0.1.2

- Fixed lambda calculus divergence exercises and added a term that does diverge.

- Changed p17 lambda calculus substitution syntax example to use the binding syntax for earlier reduction steps in addition to later ones.

- Lambda calculus notational error causing bad reduction. I (Chris) was treating xz and yz as independent variable names, not the applications of x to z and y to z respectively in (λxyz.xz(yz))(λx.z)(λx.a)    derp.

## v0.1.2 -> v0.1.3

- New layout

- Fixed spurious spacing by moving index commands to after the paragraphs the words occur in.

- 1331: "An example would the" -> "An example would be the"

- Explained and justified the answers to the third and fourth combinator exercises more thoroughly.

## v0.1.3 -> v0.1.4

- Fixed typo in return value of thirdLetter exercise in Printing chapter. (was "r", should return 'r')

- Added brief explanation and deferral of `sayHello :: String -> IO ()` to Hello Haskell.

## v0.2.0 -> v0.2.1

- Types intro changed sentence from: "We say it’s constrained because it can be any “a” given the constraint that it satisfy the requirement for a Num instance:" 
to:
"We say it's \emph{constrained} because we still don't know the concrete type of \texttt{a}, but we do know it can only be one of the types that has a \texttt{Num} instance"

- types intro, Typeclass-constrained type variables: Added words about the tuple syntax in type signatures when there are multiple typeclass constraints.


- Types intro exercises: Replaced typo'd = with :: in `let f :: a -> a -> a -> a; f = undefined`

- Basic datatypes: "Here the 8 represents how many bytes the type uses to represent integral numbers." Changed "bytes" to "bits."

- Printing: "You'll note the \texttt{putStrLn} function starts a new line, where..." changed to "You'll note the \texttt{putStrLn} function prints to the current line, then starts a new line, where..."

# v0.2.1 -> v0.3.0

- g is `a -> b -> c -> b`, then the type of `f 0 'c' "woot"` -- changed `f` to `g`.

# v0.3.0 -> v0.4.0

- (Length -> length) is a function that takes a list... in basic datatypes.

- removed "functionH [] = []" case from section 9, exercise 1 in Types chapter for clarity

- Fixed first exercise in Types in 'Manual currying and Uncurry'.

- fixed spurious "Prelude>" in type signature output for `triple :: Integer -> Integer` in the Types chapter.

- Reworded sentence in Lists, section 9.2: "Since it takes two arguments, it is a product of those two arguments, like the tuple type \texttt{(a, b)}. Unlike a tuple, however, this constructor is recursive because it mentions its own type \texttt{[a]} as one of the members of the product."

- Lists, section 9.9, removed extraneous comma (was [(+1) 1, (+1) 2, (+1), 3]): 
- map (+1) [1, 2, 3]
-        [(+1) 1, (+1) 2, (+1) 3]

- Printing, exercise: changed wording to "Is everything we need to execute `area` in scope?"

- Lambda calculus, section 1.7: removed extraneous sentence

- Functions, section 1.8 Guards: fixed `myAbs` function (added argument); inserted explanation of GHCi :{ :} notation.

- Recursion: added (Eq a) constraint to applyTimes and incTimes type signatures

- Typeclasses: added "Gimme more operations" section and its subsections, clarifying how to fix type signatures with typeclass constraints

- Basic Datatypes: arbitrarily precise but not as a efficient -> arbitrarily precise but not as efficient

- Added paragraph to Hello, Haskell, about abbreviating GHCi commands.

# v0.4.0 -> v0.5.0

- Fixed double because in "normal because because the identity function has been applied to a free" in Lambda Calculus.

- Fixed caret in Hello Haskell "Given what we know about the precedence of \texttt{(*)}, \texttt{(+)}, and \texttt{(\textasciicircum)}", using explicit TeX entity now instead of trying to escape caret.

- Clarified expectations in "building functions" exercises in Printing.

- Day of week exercise in typeclasses should have LT, not EQ, as the result for `compare Sat Fri`.
```
*Main> compare Sat Fri
LT
```

- Added notes in Basic Datatypes and Types chapters explaining difference in type signatures between older verions of GHC and GHC 7.10.1 (Foldable).

- Added paragraph explaining why the Left of Either is the failure/error case.

- In DayOfWeek example prior to the one with the custom Ord instance explained why the artisanally handcrafted Eq instance from above must be in scope or Eq must be derived for this datatype.
```
data DayOfWeek =
  Mon | Tue | Weds | Thu | Fri | Sat | Sun
  deriving (Ord, Show)
```
- In Signaling Adversity, reordered material so Unfolds fits in more coherently (moved it to exercises); reordered some other exercises to make a more natural progression.

- Added sentences in the Filtering and Mapping sections of Lists chapter emphasizing that filter and map don't mutate a list; they build new lists.

- Clarified that you don't need the insert' function for filterTree written in terms of foldTree.

- Removed apostrophe in example data for phone exercise.

# v0.5.0 -> v0.6.0

- True and False {type -> data} constructors flub in basic datatypes

# v0.6.0 -> v0.7.0

- Mention for typeclass chapter exercises that you need to import sort from Data.List

- Second (intentionally) broken let binding example in functions was missing "++" before "show z", we wanted a "y not in scope error", not that type error. Corrected to avoid confusion.

- myVal is an Integer value, not a function.

- length is Foldable t => t a, not Foldable a => t a

- has to *be* the same type, Q6 of chapter exercises for Functions

- Typeclasses, possibly -> bears the possibility of causing

- farther -> further in: back up one step further and talk about functions.

- Lambda calculus: "the single argument the lambda takes. the variable is bound when the function is applied." 

- Missing Leaf value in testTree for "convert binary trees to lists"

- More consistent types respecting polymorphism vs. concreteness in functions chapter for myNum/myVal One was Num a, other was Integer. Made them both polymorphic.

- Two misordered enumerations of the list type in Algebraic Datatypes, cons and cons value were swapped.

- `return t` at the end of the example function for the as-patterns exercises in Algebraic datatypes.

- capitalizeWords should return `[(String, String)]`

- avgGrade needed to be total in Functions.

- reworded definition of 'newtype' in Algebraic Datatypes

- Signaling Adversity: reworded two sentences for clarity: "Later, we'll see how to defend against those adverse inputs at the time we construct our datatypes, but the \texttt{Maybe} and \texttt{Either} datatypes we will demonstrate here are used in a lot of Haskell programs." and "...we could return them unmodified, we could modify them in some way different from the evens, we could return a zero, or we could write an explicit signal that nothing happened because the number wasn't even:"

- Applicative: "just as you can have more than one valid Monoid"

- Hello Haskell: fixed up some confusion with use of word "function"; made the introduction of let/where into a section; added substance to that section by demonstrating relationship to lambda calculus. Also added brief explanation of sectioning.

- Signaling Adversity: added content showing data constructors being used as functions

- Algebraic Datatypes: added some content about infix data constructors

- Printing: concat has type Foldable t => t [a] not Foldable a => t [a]

# v0.7.0 -> v0.8.0

- Lists: list comprehension, "rightmost generator", x, y, explanation with exponentiation needed fixing and rewording.

- Basic Datatypes: "Hello Haskell" is no longer chapter 1, changed mention of variable conventions to use the name of the chapter.

- Basic Datatypes: look at these two functions -> look at these two expressions

- Printing: Reset PrintN.hs example enumerations.

- Hello Haskell: laws for quot/rem are now verbatim rather than code.

- Applicative: added append to List exercise

- Recursion: 'Because we have the base case \texttt{factorial 0 = 1} in the fixed version, here is how our reduction changes:' - moved, fixed base case from 1 = 1 to 0 = 1.

- Lambda Calculus: missing . to separate head and body of nested lambda.

- Monoid: Type of `trivialSmush` should be `Trivial -> Trivial -> Trivial`

- Lambda Calculus: modified answer to Beta Reduce exercise #7 for clarity

- Functor: let lmls = [ha, Nothing, Just Nothing] was incorrect; correct version: let lmls = [ha, Nothing, Just []]

- Monoid: Maybe exercise had the wrong specification of behavior.

- Functor: instances for Two and Or had minor errors:
    fmap f (Two a b) = Two a (f b) ; fmap f (Second b) = Second (f b)

- Monoid: Mem needed a hint

- Lists: Cons definition referred to wrong values

- Functions: fixed mismatched function name, productUnpack

- Recursion: fixed factorial base case mismatch

- Algebraic Datatypes: cellPhonesDead should have type Digit = Char

- Signaling Adversity: changed name of maybe catamorphism function to avoid conflict with Prelude

- added new exercises to Lists, Folds, Signaling Adversity, Modules, and Testing (ciphers)

- Algebraic Datatypes: "type-level functions" will not be covered in the book; added link to resource for those who are curious about topic

- Functors: when asked how (fmap . fmap) even typechecks, we turned it into an exercise. Enjoy!

# v0.8.0 -> v0.9.0

- Types chapter: Chapter Exercises, section "Given a type, write the function", #5: fixed wording of instructions (there are multiple possibilities for that type signature; two that have appeared by that point in the book)

- Fixed there being a fourth exercise in Applicative

- Specification of Constant Applicative was incorrect

- Characterization of the relationship between Eq, pattern matching, case expressions, and guards in Signaling Adversity corrected and expanded upon. Near "PersonInvalid"

- Replaced square/sqrt QuickCheck exercise in Testing with a list sorting exercise

- Fixed Maybe Monoid in the Applicative chapter under "Maybe Monoid and Applicative"

- In "Folding and evaluation", foldr const 0 (repeat 0 ++ [1,2,3]) evaluates to 0, not 1

- In "Lists", the mySqr value defined by a list comprehension is a list

- Augmented type-kwon-do instructions

- EqProp ZipList' exercise in Applicative needs its own take' defined for List

- do -> does in Lists chapter exercises regarding the "second set"

- [4] should be under the RHS where UnaryValueCon is in Algebraic Datatypes

- fromIntegral, not fromInteger for the avgDb exercise in folds

- Better answer for the "only triples that start with the letter 'p'" in Folds

- Corrected etymology for nullary. It's null + -ary

- First exercise in "Intermission: Lifting Exercises" is now properly broken and necessitates the use of fmap.

- Fixed 'append' in Applicative for the custom list type

## v0.9.0 -> v0.9.1

- Fixed semigroup/monoid examples and exercises using QuickCheck

- Fixed CountMe functor/applicative to pass the laws

- Unlifted kind desciption was inaccurately narrow

- Signaling Adversity: problem in example, changed to 
Prelude> mkPerson "blah" 0
Just (Person "blah" 0)

- Elaborated on non-strictness, take, and length in the folds chapter.

- Since we were specifically talking about the type in Id Integer, it makes more sense to say we applied away the (->) in the type constructor in algebraic datatypes.

- Fixed ASCII representation of binary tree generated by treeBuild in Signaling Adversity

- Formatting in the exercises of Lists

- Parsec parser running  char 'a' <|> char 'b' >> char '1'  returns Right '1' for example input, not "123"

- Reader chapter: fixed sentence for clarity: "it will be monomorphic by default; if you wish to make $m$ polymorphic, you may change its signature but you also need to specify a polymorphic type for the two functions it’s built from"

- In algebraic datatypes, when working with the Sum type, the sheep was named Elmo, not Baaaaaa. The type error has been changed to reflect this.

- Explicit foldable constraint in Foldable exercises.

- Functor chapter: added a "definition" of "lifting"

- Types chapter: added a hint about syntax to the "write a type signature" exercise

- StateT needs a Monad constraint, Applicative isntance needs order-dependence anyway.

- foldr for Tree rewritten into Instances for Tree in the Traversable chapter.

- Clarifying isomorphism commentary in State, added positive and negative examples.

- lambda abstractions are just lambdas, not declarations.

- Speculatively removed gratuitous comparison to Reader from State description.

- StdGen varies more than N in "rollsToGetN", so StdGen is bumped to being the second argument.

## v0.9.1 -> v0.9.2

- Adding a warning to the StateT Applicative instance exercise that the NICTA Course issue gives the answer away.

## v0.9.2 -> v0.10.0

- Fixed arrow spacing in Composing Types for runIdentityT

- Fixed Moi test for Functor to not require Applicative

- Control.Monad.Trans.State not import Control.Monad.State in the State chapter for fizzbuzz

- Foldable t, not Foldable a.

- Missing import of Control.Applicative to be able to use <|>

- Broken footnoting at 24.5

- We unmarshall after parsing.

- Fixed listOrdered to handle cases like `[1,10,2,3]`

- Semigroups exercise is talking about, "The Semigroup for Or", not the monoid.

- Fixed wording and numbering of the ninth monoid exercise

- Result of a parser for the SemVer exercise should've been wrapped in Success.

- Explained type for foldTree in algebraic datatypes

- Rewrote Applicative (<*>) == Monad ap explanation in the Monad chapter

- Fixed expected answer for 16.7 exercise #1

- Changed maximum/minimum exercises in Foldable to not be partial.

- Fixed String where we meant Morse.

- `fab` in monad transformers for the MaybeT example was `m (Maybe (a -> b))`

- pre/in/postorder don't need an Ord instance

- Replaced `myEnumFromTo` exercise with concreted instances

- Added a better demonstration of kleisli composition to the Monad chapter

- Split long code block in Lists chapter to cope with limited vertical space in e-reader variant

- Arbitrary and EqProp instances already exist for `(,,)`

- No (Eq a =>) in the methods of the definition of Eq in the typeclasses chapter.

- Fixed indentation due to spurious enumeration capture of section 8.5 in Recursion

- Duplicate initial steps in lambda calculus beta reduction answers

- Unnecessary parens in lambda calculus beta reduction answer

- ListyInstances.hs, not ListyInstances.h in Monoids

- `...?` in exercise confuses people, replaced with bottom.

## v0.10.0 -> v0.10.1

- clarified distinction between arguments and parameters in Chapter 2. made changes in usage of these terms in Chapters 2, 5, 6, and 7. 

- Chapter 1 (lambda calculus) has been substantially revised

- Don't use print for example of GHCi showing values not in IO

- Add footnote describing an old programmer trick for dealing with weird program (in this case, benchmark) results.

- Added sentence describing where one could find example NFData instances.

- Fixed wc function example with foldr in laziness.

- Moved and refined definition of higher kinded type from Functor to Signaling Adversity

- Added definition of higher kinded polymorphism to Functor

- Changed evaluation steps for possiblyKaboom in non-strictness.

## v0.10.1 -> v0.10.2

- Removed spurious `Or` Monoid exercise

- Left and right monoid identities in the quickcheck section for Monoid were swapped

- Removed unnecessary type assignment in Applicative QuickCheck example given verbiage that follows about type defaulting

- s/monthNum/dayOfMonth/ in typeclasses Eq example

- Added better examples for Option Monoid exercise

- Added currying/uncurrying example for types intro

- Fixed mkSphericalCow getting cut off

- Fixed CountMe Applicative instance in Monad

- Added section on `mod` to Chapter 2

- in Chapter 5, fixed a parenthesization mistake: (a -> b) -> ([a] -> [b])

- Various typos and fixes.

## v0.10.2 -> v0.11.0

- Various typos and fixes.

- Lots of typesetting and layout fixes.

- The modules chapter has been converted to use Stack.

## v0.11.0 -> v0.11.1

- The testing chapter has been converted to use Stack.

- Starting to get the index together.

## v0.11.1 -> v0.11.2

- Revised preface & introduction, fixed cover.

## v0.11.2 -> v0.12.0

- Extensive, but individually small, edits covering lambda calculus through algebraic datatypes.

## v0.12.0 -> 1.0RC1

- Many, many small edits to get the book ready for final release.

- A *beta* version of the epub has been incorporated into the release alongside the usual screen and ereader optimized PDF files. This is mostly unstyled and plain as it is intended primarily for the readers that will be using screen readers. In order for the first chapter to be screen-read properly you will need to install math font support for your screen reader. Please see these websites for more information: 

  * http://accessibility.psu.edu/math/mathml/
  * https://github.com/mathjax/MathJax-docs/wiki/List-of-math-enabled-screen-readers

More work will be done to hammer out more precise instructions for screen reader compatibility with the epub.

## 1.0RC1 -> 1.0RC2

- All instances of the LaTeX `\input` macro have been inlined manually. They didn't work properly in the ePub build of the book and were sort of a historical oddity from earlier versions of the book anyway. A secondary effect of this is that some instances of wonky layout were caught and fixed.

- Some exercises in the Monoid/Semigroup were clarified. Among other things there had been a red herring in the hint for the `Combine` exercise, this has been fixed.

- A suggestion to use the `frequency` function from QuickCheck has been added to the Monoid chapter.

- Readers are now reminded to use the proper capitalization of `QuickCheck`'s package name in the Testing chapter.

- A code block in the recursion chapter was too long and overflowed off the page. It has been split to fix the layout.
