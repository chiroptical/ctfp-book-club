# ctfp-book-club

Pittsburgh Functional Programming Book Club featuring Category Theory for
Programmers by Bartosz Milewski. The content for the book can be found [on github][book].
Additionally, print copies can be purchased from [blurb][print book].
This repository is going to serve a few purposes:

1. Describe the [Motivations](#motivations) behind hosting this book club
2. Describe the [Format](#format) of our book club
3. Contain code from exercises submitted by various folks in our group
4. Show the [Schedule](#schedule) and [Guidelines for Participation](#guidelines-for-participation)

## Motivations

In no particular order,

- Understand practical applications of category theory, e.g. databases
- Understand "categorical semantics" sections of literature
- Fully realizing the various typeclasses
- Explore foundational aspects of computer science
- Whether or not this can be used as a modern educational tool
- Understand design decisions of programming languages
- Discover relationships in the semantics of programming language

## Format

The book club will meet once per month on the third Monday of the month
starting on October 21st 2019. We will be broadcasting our conversations live
on [my twitch channel][twitch]. We will be using [zoom][zoom] to do our video
conferencing.

Each week we will discuss chapters or topics from the book (see
[Schedule](#schedule)). We will work our way through discussing the content as
well as what is requested via Zoom or Twitch chat. If we encounter exercises,
we will compare and contrast solutions.

Regarding exercises, attendees will submit code in the `exercises/` directory
via a PR to `exercises/{user}/chapter{N}` where `{user}` is your Github
username and `{N}` is the chapter we are working on. An example PR is available
[here][pr1]. Please provide some details in a top-level `README.md` about how
to run your examples.

Regarding past content, discussion and comments on past material is encouraged
however jumping forward in the book will be discouraged. We want folks to be
able to catch up and not leave them behind.

## Schedule

All streams will start at 7:30 PM EST

- 10/21/19: Explanation of book club and Chapter 1
- 11/18/19: Chapter 2
- 12/16/19: Chapter 3
- 01/20/20: Chapter 4
- 02/17/20: See https://github.com/barrymoo/ctfp-book-club#february-17th and https://github.com/barrymoo/ctfp-book-club/issues/19
- 03/16/20: See https://github.com/barrymoo/ctfp-book-club#march-16th and https://github.com/barrymoo/ctfp-book-club/issues/21
- 04/27/20 (postponed from 04/20/20): See https://github.com/barrymoo/ctfp-book-club#april-20th and [#28](https://github.com/barrymoo/ctfp-book-club/issues/28)
- 05/18/20: See https://github.com/barrymoo/ctfp-book-club#march-18th and [#31](https://github.com/chiroptical/ctfp-book-club/issues/31)
- 07/20/20 (postponed from 06/22/20): See https://github.com/barrymoo/ctfp-book-club#july-20th and [#32](https://github.com/chiroptical/ctfp-book-club/issues/32)
- 08/17/20: See https://github.com/barrymoo/ctfp-book-club#august-17th and [#36](https://github.com/chiroptical/ctfp-book-club/issues/36)

## Proposed Curriculum

We realized that at the rate we are going it will take ~3 years to complete the
book. This didn't sit well with some of us. We had 2 options; increase the
frequency of meetings, or increase the volume of reading per meeting. Meeting
more frequently is more onerous on everyone's already busy schedules, however
going over more material while meeting with the same cadence constrains the
depth conversation. Our solution is to add more volume, but use issues (e.g. [#19](https://github.com/barrymoo/ctfp-book-club/issues/19))
to narrow down to the important discussion points. Anyways, here is the proposed
curriculum moving forward. The idea is that we will complete up to `Section 3`
by July, and re-evaluate interest in continuing forward!

#### February 17th
- Reading:
    - `Chapter 5 - Products and Coproducts`
    - `Chapter 6 - Simple Algebraic Data Types`
- Additional Materials for the Interested Participant:
    - [Bartosz Terminal and Initial Objects](https://www.youtube.com/watch?v=zer1aFgj4aU)
    - [Dialectic on Any type as a Terminal Object](https://alexknvl.com/posts/any-is-final-object.html)
    - [Bartosz Products](https://www.youtube.com/watch?v=Bsdl_NKbNnU)
    - [Bartosz ADTs](https://www.youtube.com/watch?v=w1WMykh7AxA)
    - [Bartosz Coproducts, Sum Types](https://www.youtube.com/watch?v=LkIRsNj9T-8)
    - [Catsters Series on Products / Coproducts](https://www.youtube.com/watch?v=upCSDIO9pjc)

#### March 16th
- Reading:
    - `Chapter 7 - Functors`
    - `Chapter 8 - Functoriality`
- Additional Materials for the Interested Participant:
    - [Bartosz on Functors](https://www.youtube.com/watch?v=FyoQjkwsy7o)
    - [Bartosz on Functors in Programming](https://www.youtube.com/watch?v=EO86S2EZssc)
    - [Bartosz on Functoriality, Bifunctors](https://www.youtube.com/watch?v=pUQ0mmbIdxs)
    - [Bartosz on Functoriality, Profunctors](https://www.youtube.com/watch?v=wtIKd8AhJOc)
    - [George Wilson on Varieties of Functors](https://www.youtube.com/watch?v=JUVMiRRq6wU)
    - [George Wilson on Functor Contravariance](https://www.youtube.com/watch?v=IJ_bVVsQhvc)

#### April 20th

- Profunctors
    - [Emily Pillmore et al. on Profunctor Optics](https://arxiv.org/pdf/2001.07488.pdf)
    - [Vladimir Ciobanu on Functor Family](https://cvlad.info/profunctor/)

#### May 18th

- Reading
  - `Chapter 9  - Function Types`
- Additional Materials for the Interested Participant:
  - [Bartosz on Function Objects](https://www.youtube.com/watch?v=REqRzMI26Nw)
  - [Bartosz on Type Algebra](https://www.youtube.com/watch?v=REqRzMI26Nw)

#### July 20th

- Reading:
    - `Chapter 10 - Natural Transformations`
- Additional Materials for the Interested Participant:
    - [Bartosz on Natural Transformations](https://www.youtube.com/watch?v=2LJC-XD5Ffo)
    - [Catsters on Natural Transformations](https://www.youtube.com/watch?v=FZSUwqWjHCU)
    - [Purescript's Natural Transformation](https://pursuit.purescript.org/packages/purescript-prelude/3.1.0/docs/Data.NaturalTransformation)
    - [Importance of Natural Transformations](https://math.stackexchange.com/questions/1360849/on-the-importance-of-natural-transformations)

#### August 17th

- Reading
    - `Chapter 11 - Declarative Programming`
    - `Chapter 12 - Limits and Colimits`
    - `Chapter 13 - Free Monoids`
- Additional Materials for the Interested Participant:
    - [Declarative Vs Imperative](https://www.youtube.com/watch?v=3XTQSx1A3x8) (note: this is philosophically interesting, but not actually that relevant)
    - [Bartosz on Limits](https://www.youtube.com/watch?v=sx8FELiIPg8)
    - [Bartosz on Higher Order Functors](https://www.youtube.com/watch?v=sx8FELiIPg8)
    - [Bartosz on Naturality Conditions](https://www.youtube.com/watch?v=1AOHbF6Ex8E)
    - [Bartosz on Examples of Limits and Colimits](https://www.youtube.com/watch?v=TtvVHokhSoM)
    - [Bartosz on Free Monoids](https://www.youtube.com/watch?v=FbnN0uomy-A)
    - [Catsters on Limits and Colimits](https://www.youtube.com/watch?v=g47V6qxKQNU)
    - [Cat. Theory for Beginners: Limits](https://www.youtube.com/watch?v=iCnF67nnpek)
    - [Pullbacks and Pushouts](https://www.youtube.com/watch?v=XGysPJvCXOc)

#### Suggested Week
> Note: This week will be really hard, Rep. Functors
> and Yoneda are heavily related but both very difficult
- Reading
    - `Chapter 14 - Representable Functors`
    - `Chapter 15 - The Yoneda Lemma`
- Materials for the Interested Participant:
    - [Bartosz on Representable Functors](https://www.youtube.com/watch?v=KaBz45nZEZw)
    - [Representable Functors in Haskell](https://hackage.haskell.org/package/representable-functors-3.2.0.2/docs/Data-Functor-Representable.html)
    - [Bartosz on Yoneda Lemma](https://www.youtube.com/watch?v=BiWqNdtptDI)
    - [Catsters on Yoneda and Representables](https://www.youtube.com/watch?v=4QgjKUzyrhM)
    - [Approaching Yoneda](https://www.youtube.com/watch?v=TWFI4aN4h0Q)

#### Suggested Week
- Reading
    - `Chapter 16 - Yoneda Embedding`
- Materials for the Interested Participant:
    - [Bartosz on Yoneda Embedding](https://www.youtube.com/watch?v=p_ydgYm9-yg)
    - [Cat. Theory for Beginners: Yoneda](https://www.youtube.com/watch?v=h64yZs8ThtQ)

## Guidelines for Participation

We are encouraging active participation in the book club from anyone
interested. To be involved you should tune into the [stream][twitch] during the
scheduled times where a link to the Zoom conference as well as a password will
be provided to. In Zoom we will use the [raise hand][raise hand] feature to
determine who can talk. You will only be warned once for not following the
rules. If you break the rules I will remove you from the call. If you are
discussing anything inappropriate I will remove you immediately.

Pull requests to this repository will be accepted if they follow the
guidelines from the [Format](#format) section. They will not be checked for
correctness.

<!-- Useful links below -->
[book]: https://github.com/hmemcpy/milewski-ctfp-pdf
[print book]: https://www.blurb.com/b/9621951-category-theory-for-programmers-new-edition-hardco
[twitch]: https://www.twitch.tv/chiroptical
[zoom]: https://zoom.us/
[pr1]: https://github.com/barrymoo/ctfp-book-club/pull/1
[raise hand]: https://support.zoom.us/hc/en-us/articles/205566129-Raise-Hand-In-Webinar
