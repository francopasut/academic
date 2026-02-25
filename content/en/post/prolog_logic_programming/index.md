---
title: "Prolog: between logic and programming language"
date: 2026-02-25
slug:  prolog_logic_programming
categories:
  - Blog
tags:
  - Prolog
  - Python
  - Logic Studio Code
image:
  placement: 3
  preview_only: false 
  caption: 'Prolog and Philosophy'
canonicalUrl: https://francopasut-en.blogspot.com/2026/02/prolog-between-logic-and-programming.html
---

- [1. Introduction](#1-introduction)
- [2. Hands on the keyboard](#2-hands-on-the-keyboard)
- [3. Example](#3-example)
- [4. The appeal of Prolog](#4-the-appeal-of-prolog)
- [5. Let's play with logic](#5-lets-play-with-logic)
  - [5.1. Prolog version](#51-prolog-version)
  - [5.2. Python version](#52-python-version)
- [6. Observations on the two languages](#6-observations-on-the-two-languages)


# 1. Introduction

Created in the 1970s for natural language processing and artificial intelligence, Prolog (short for "Programmation en Logique") is a somewhat unusual programming language.

Prolog's “logic” focuses on defining relationships and facts rather than sequential instructions. 

The language is based on three fundamental pillars:

-   Facts: Absolute truths about the world we are modeling.
-   Rules: Conditional relationships that allow us to infer new information.
-   Queries: Questions asked of the system to verify the truth of a statement or find solutions.

In Prolog, there are no “for” loops or variables in the traditional sense.

# 2. Hands on the keyboard

To test Prolog code on your computer it's possible to install SWI-Prolog, the most widely used and documented open source implementation.

For example, for Debian (which I am currently using) and derivative distributions: `sudo apt install swi-prolog.`

To write sources in Prolog, you need to add the extension `.pl` to the files.

To make queries, proceed as follows:

-   Start the interpreter by opening the terminal and typing `swipl`.
-   Type the query command including the final period: `?- consult(‘family.pl’).`
-   Write the *query*, i.e., the requests.

Or, much more simply, you can use an online environment, similar to Colab for Python.

I have used the SWISH environment (<https://swish.swi-prolog.org/>) without any problems: just open the site, write facts and rules, then write queries in the box at the bottom right and press *Run!* or `Ctrl+Ret`.

# 3. Example

Here is a simple example of source code in Prolog:

    % DATABASE: Facts
    parent(marco, luca).
    parent(julia, luca).
    parent(luca, anna).
    
    % LOGIC: Rule
    % A person is a grandparent if they are a parent of a parent.
    grandparent(X, Z) :- 
        parent(X, Y), 
        parent(Y, Z).

Query examples:

1.  Query: `?- parent(marco, luca).`
2.  Result: `true` (The system confirms the fact).
3.  Query: `?- grandparent(marco, anna).`
4.  Result: `true` (The system applies the logical rule).
5.  Query: `?- parent(luca, Who).`
6.  Result: `Who = anna` (The system finds the identity that satisfies the relation).

# 4. The appeal of Prolog

What is the point today of studying a language that was created decades ago with the promise of shaping the “future” of Artificial Intelligence?

Today, AI is finally among us, it has become a reality and permeates every aspect of daily life, but its implementation has taken different paths, relying on different languages and paradigms.

This begs the question: ****is Prolog still useful?****

The answer probably does not lie in productivity for its own sake. The real appeal of Prolog  lies  in its ****essence****.

Prolog is not a common programming language but  much more like a ****game of pure logic****, an intellectual maze where there are no commercial objectives, only the pleasure of deduction.

-   ****No commands are given:**** Facts and relationships are declared.
-   ****The “how” is not described:**** The “what” is defined.
-   ****The goal is logic itself:**** Solving a problem in Prolog is a philosophical exercise rather than a technical one.

Prolog seems to me to be more suited to the humanities, such as philosophy, than to computer science.

In any case, philosophy and computer science are both involved in language, as in the cover image of this article.

In a world dominated by pragmatism, Prolog is proof that a language can be “useful” not for what it allows you to **build**, but for how it forces you to **think**.

Prolog therefore remains “useful” and relevant in logic, symbolic artificial intelligence, natural language processing, and expert systems, where declarative programming simplifies complex problems.

# 5. Let's play with logic

To demonstrate Prolog's ability to solve logic puzzles, I propose a very simple game in two formats: Prolog and Python.

The game is a classic logic puzzle: the Murder Mystery. It is a small deductive mystery where we have to find out who the culprit is based on certain facts and rules.

## 5.1. Prolog version

    % --- FACTS ---
    person(alice).
    person(john).
    
    weapon(gun).
    weapon(knife).
    
    location(kitchen).
    location(study).
    
    % Evidence: Who has what and where they are
    is_at(alice, kitchen).
    is_at(john, study).
    
    possesses(alice, knife).
    possesses(john, gun).
    
    % --- RULES ---
    % A person is the culprit if they were at the crime scene (study)
    % and they possess the murder weapon (gun).
    culprit(X) :- 
        person(X),
        is_at(X, study),
        possesses(X, gun).

To find the culprit, type `?- culprit(Who).` in the Prolog terminal (including the online version).

The system responds with `Who = gianni.`.

## 5.2. Python version

    # --- DATA STRUCTURE ---
    suspects = [
        {"name": "Alice", "location": "kitchen", "weapon": "knife"},
        {"name": "John", "location": "study", "weapon": "gun"}
    ]
    
    crime_scene = "study"
    murder_weapon = "gun"
    
    # --- LOGIC ---
    def find_culprit(suspect_list):
        for suspect in suspect_list:
            # We explicitly tell Python how to compare the values
            if suspect["location"] == crime_scene and suspect["weapon"] == murder_weapon:
                return suspect["name"]
        return "No culprit found"
    
    # --- EXECUTION ---
    guilty_party = find_culprit(suspects)
    print(f"The culprit is: {guilty_party}")

To launch the program in Python, I recommend the online service [Google Colab](https://colab.research.google.com).

# 6. Observations on the two languages

This small example clearly shows the difference between a logic-based programming language and a traditional one.

In the first case, i.e., in the Prolog source code, what is true is described, while in the second case, i.e., in the Python source code, how to find the solution is described.

The search engine in Prolog is integrated (Backtracking): it automatically searches among the declared facts.

The search engine in Python, on the other hand, must be built using *for* loops or *if* statements.

Data in Prolog is declared in code that directly contains a database of facts.

In Python, data must be structured (lists, such as dictionaries, or classes, which are not present in this specific case).

It is true that Python is much more versatile and has huge libraries.

However, Prolog also performs well: note the elegance and cleanliness of the code in Prolog compared to its Python counterpart.

Also consider that in Prolog, if we added a third suspect, it would not be necessary to change the search “function,” so the source would remain clean and tidy.

In Python, if the logic became more complex (e.g., “A is guilty if B lies”), the code would become more complex with an additional series of if-else statements.

Thank you for your attention.

