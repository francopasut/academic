---
title: "From latin grammar to Prolog programming: a comparison of two worlds"
date: 2026-10-27
slug:  latino_prolog
categories:
  - Blog
tags:
  - Latin
  - Prolog
image:
  placement: 3
  preview_only: false 
  caption: 'Latin and Prolog'
canonicalUrl: https://francopasut-en.blogspot.com/2026/10/from-latin-grammar-to-prolog.html
---

- [1. Summary of one of my previous articles on Prolog](#1-summary-of-one-of-my-previous-articles-on-prolog)
- [2. Prolog and Latin](#2-prolog-and-latin)
- [3. Sentence Structure](#3-sentence-structure)
- [4. Flexibility of word order](#4-flexibility-of-word-order)
- [5. Analysis of Query Behavior in Prolog](#5-analysis-of-query-behavior-in-prolog)
- [6. Why does this support the article?](#6-why-does-this-support-the-article)
- [7. Why doesn’t the same observation hold true for other programming languages?](#7-why-doesnt-the-same-observation-hold-true-for-other-programming-languages)
- [8. Conclusions](#8-conclusions)


# 1. Summary of one of my previous articles on Prolog

I have already mentioned Prolog in one of my  [previous articles](https://francopasut-en.blogspot.com/2026/02/prolog-between-logic-and-programming.html), from which I’ll provide a brief summary.

Developed in the 1970s for natural language processing and symbolic artificial intelligence, Prolog (**Programmation en Logique**) differs from traditional programming languages in its declarative paradigm, which focuses on defining facts, rules, and conditional relationships rather than on writing sequential instructions or control algorithms.

Rather than specifying “how” to solve a problem through loops or procedural constructs, programming in Prolog consists of declaring “what” is true and querying the system, leaving it to the built-in resolution engine (**backtracking**) to perform the logical deductions.

Although modern AI has largely shifted toward statistical learning and other languages such as Python, Prolog’s primary value lies in its educational and philosophical essence: more than just a productive tool, it constitutes an exercise in pure logic that transforms the way we model thought, remaining highly relevant in expert systems, knowledge representation, and the resolution of complex deductive problems with concise and elegant code.

In Prolog, you declare facts and rules; then you ask questions, leaving it up to the program to find an answer.

# 2. Prolog and Latin

Is it possible to hypothesize a connection between the Prolog language and the Latin language?

At first glance, no! Prolog and Latin seem to belong to worlds far apart.

Prolog does not derive from Latin and was not created to translate it.

So what connection could there be?

A possible connection does exist and can be an interesting way to understand both grammar and programming.

The similarity lies in the way we can describe information.

The following examples use the SWI-Prolog language installed on Debian Linux. This article was written in Emacs Org Mode, like almost all of my previous articles.

# 3. Sentence Structure

Let’s consider the very simple Latin sentence “/puella rosam amat/” (“the girl loves the rose”).

In Latin, the subject *puella* is in the nominative case, the object *rosam* is in the accusative case, and the verb *amat* agrees with the subject.

Word order in Latin is flexible because the grammatical cases tell us who does what.

In Prolog, we can represent this same logical relationship by defining a predicate:

    % Basic facts
    name(puella).
    name(rosa).
    
    % Relationship: who loves whom
    % loves(Subject, Object)
    loves(puella, rosa).

# 4. Flexibility of word order

Since Latin allows for variations in word order without losing the main meaning, we can also say *rosam puella amat*. The underlying logic remains the same.

Similarly, in Prolog, the logical structure of the data is independent of its visual or textual presentation. We can query the system in different ways:

    ?- loves(Who, What).
    Who = puella,
    What = rosa.

# 5. Analysis of Query Behavior in Prolog

To better understand the above, it is necessary to clarify how Prolog handles the positional correspondence of arguments with respect to the variable names we choose to use in the query (*query*).

In the example defined above:

    loves(puella, rosa).

the data structure is positional, and by convention (explicitly stated in the code comment as `loves(Subject, Object)`), the first argument represents the subject and the second the object.

When you write:

`?- loves(Who, What).`: you are placing the variable `Who` in the first position (subject) and `What` in the second position (object). The Prolog engine then returns `Who = puella` and `What = rosa`.

`?- loves(What, Who).`: This reverses the variable names in the query. In other words: `What` is in the first position and `Who` in the second. Since the original fact always keeps `puella` in the first position and `rosa` in the second, Prolog will consistently assign `What = puella` and `Who = rosa`.

# 6. Why does this support the article?

The article’s assertion that *“the logical structure of data is independent of its visual or textual presentation”* means that the fundamental logical relationship between the data (`loves(puella, rosa)`) is not altered by the way you choose to query the system or by the arbitrary names (`Who`, `What`, or `X`, `Y`) you assign to the variables.

Just as in Latin, the logical understanding of meaning is not lost even if the visual order or arrangement of words in a sentence is changed; in Prolog, the logical relationship is independent of the transient syntactic form of the query.

The variables in the query are merely labels or positional “containers”: reversing the order of the variables in the query (`What, Who`) reverses the containers into which the values are inserted, but the logical truth and the underlying data structure remain perfectly identical.

# 7. Why doesn’t the same observation hold true for other programming languages?

In traditional programming languages such as Python, the underlying paradigm is imperative, procedural, or object-oriented—fundamentally different from Prolog’s logical and declarative paradigm. This structural difference affects how data and functions are interpreted.

In procedural languages, code is a set of sequential instructions that the computer must execute step by step to compute a result. When you define a function or call a method in Python—for example, \`love(subject, object)\`—the arguments passed follow a strict positional order (unless you explicitly specify the parameters using keyword arguments). The order in which you enter the values directly determines the logical flow and operational meaning: reversing the arguments in a function call in Python immediately alters the data processed within the code block, because the language executes exactly what it is instructed to do in that specific sequence.

Prolog, on the other hand, does not describe how to compute a result using an algorithm, but rather states what is true within a system of logical relations. A clause such as **loves(puella,rosa)** is not a function to be executed, but a factual assertion within a relational space. The Prolog engine does not follow a sequential control flow but uses unification (a pattern-matching technique based on first-order predicate logic) to verify the logical compatibility between the query and the knowledge base.

For this reason, while in Python the syntax and order of calls are inextricably linked to an algorithmic computation procedure, in Prolog the data structure is conceived as a network of pure relations, independent of procedural execution or a rigid sequence of instructions.

# 8. Conclusions

This comparison reveals an unexpected affinity between formal logic and historical linguistics, both of which are united by the centrality of structural relationships.

This fundamental nature is also reflected in the choice of Org Mode for drafting the text: a tool that preserves its clarity and structure, facilitating its integration and final presentation.

Thank you for your attention.

