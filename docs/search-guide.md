# Search guide

Branchway has three ways to search, and they share one grammar.

- **The band field** searches the folder you are in. Press ⌘F to focus it. Return opens the Search page
  with the same query.
- **The Search page** searches the places you pick and shows what Branchway understood as chips under the
  field.
- **⌘K** is the command palette. When no command matches what you type, it offers to search for it.

## Filters

Type a filter as `keyword:value`. Branchway turns it into a chip.

| Keyword | Meaning | Example |
|---|---|---|
| `kind:` (also `type:`) | What the item is: folder, image, document, pdf, movie, audio, archive, code, application, or a uniform type identifier | `kind:pdf` |
| `ext:` (also `extension:`) | File extension | `ext:heic` |
| `size:` | Compare with `=`, `<`, `<=`, `>`, `>=` | `size:>500MB` |
| `modified:` | When it last changed | `modified:today` |
| `created:` | When it was created | `created:2026-01-01` |
| `tag:` | A Finder tag | `tag:Red` |
| `in:` | Where to look | `in:Downloads` |

Anything else is matched against names. Wrap a phrase in double quotes to match it exactly.

## Sentences

You can also type a sentence, such as `pdfs from last week bigger than 5 MB in downloads`. Branchway reads
it into the same chips and shows them under the field as "Understood as". Rules of thumb:

- Sentence search is **English only**. The app's interface is available in 16 languages, but the sentence
  reader understands English.
- One word never becomes a chip. It is just a name search.
- A part Branchway understands but cannot filter on appears as a greyed, dashed chip that filters nothing,
  so you can see what was ignored.
- Chips are editable on the Search page. In the live strip under the band they are read-only.

## Where it looks

Branchway uses an index it builds in the background and keeps up to date, so results are quick and include
hidden and system files. While the index is still being built, or if it is switched off, Branchway falls
back to Spotlight or to walking the folder, which is slower and can be incomplete.

## In-image search

If you turn on image indexing in Settings › Search, Branchway can find photos by what they show, for
example `sunset over water`. It labels each image on your Mac with Apple's Vision framework and, if you
install the optional model (see [model](model.md)), also matches the meaning of your words.

- Everything happens on your Mac. Images are not uploaded.
- It matches objects and scenes. It does not identify people or pets.
- Without the model, the vocabulary of labels is limited, and colour words are not matched.
- Indexing a large library takes time. Settings › Search shows progress.
