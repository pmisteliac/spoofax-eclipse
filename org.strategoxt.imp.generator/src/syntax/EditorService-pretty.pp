[
   ReferenceHoverRule   -- R [ H [ KW["reference"] _1 ] KW[":"] H [ _2 _3 ] ],
   ReferenceRule        -- R [ H [ KW["reference"] _1 ] KW[":"] _2 ],
   HoverRule            -- R [ H [ KW["hover"]     _1 ] KW[":"] _2 ],
   OccurrenceRule       -- R [ H [ KW["occurrence"] _1 ] H [ KW[":"] _2 ] ],
   SemanticProvider     -- R [ H [ KW["provider" ] ] KW[":"] _1 ],
   SemanticObserver     -- R [ H [ KW["observer"] ]  KW[":"] _1 ],
   Builder              -- R [ H [ KW["builder"] ]   KW[":"] _1 H [ KW["="] _2 _3 ] ],
   Builder.3:iter-star  -- _1,
   OpenEditor           -- KW["(openeditor)"],
   RealTime             -- KW["(realtime)"],
   Persistent           -- KW["(persistent)"],
   Strategy             -- _1,
   Attribute            -- H hs=0 [ KW["id"] KW["."] _1 ],
   Analysis             -- V is=2 [H hs=0 [ KW["analysis"] _1 ] A(l,l,l) [_2] ],
   References           -- V is=2 [H hs=0 [ KW["references"] _1 ] A(l,l,l) [_2] ],
   Occurrences          -- V is=2 [H hs=0 [ KW["occurrences"] _1 ] A(l,l,l) [_2] ],
   Strategy             -- _1,
   Attribute            -- H hs=0 [ KW["id"] KW["."] _1 ],
   Builders             -- V is=2 [H hs=0 [KW["builders"] _1] A(l,l,l,l,l,l) [_2]],
   Builders.2:iter-star -- _1,
   Colorer              -- V is=2 [H hs=0 [KW["colorer"] _1] A(l,l,l,l,l,l) [_2]],
   Colorer.2:iter-star  -- _1,
   ColorDef             -- R [ _1 KW["="] _2],
   ColorRuleAll         -- R [ H [ KW["environment"] _1 ] KW[":"] H [ _2 ] ],
   ColorRule            -- R [ H [                   _1 ] KW[":"] H [ _2 ] ],
   ColorRuleAllNamed    -- R [ H [ KW["environment"] _1 ] KW[":"] H [ _2 ] KW["="] H [ _3 ] ],
   ColorRuleNamed       -- R [ H [                   _1 ] KW[":"] H [ _2 ] KW["="] H [ _3 ] ],
   Attribute            -- _1 _2 _3,
   Attribute            -- _1 _2 _3,
   AttributeRef         -- _1,
   FoldRuleAll          -- H [ KW["all"] _1 _2 ],
   FoldRule             -- H [ _1 _2 ],
   Disable              -- KW["(disable)"],
   Folded               -- KW["(folded)"],
   None                 -- ,
   OutlineRule          -- _1,
   Values                 -- H [ _1 ],
   Values.1:iter-star-sep -- _1 KW[","],
   Language             -- V is=2 [H hs=0 [KW["language"] _1] A(l,l,l) [_2]],
   Language.2:iter-star -- _1,
   LanguageName         -- R [ KW["name"] KW[":"] _1 ],
   LanguageId           -- R [ KW["id"] KW[":"] _1 ],
   Extensions           -- R [ KW["extensions"] KW[":"] _1 ],
   Description          -- R [ KW["description"] KW[":"] _1 ],
   Table                -- R [ KW["table"] KW[":"] _1 ],
   StartSymbols         -- R [ H [ KW["start"] KW["symbols"] ] KW[":"] _1 ],
   NoStartSymbols       -- KW["_"],
   URL                  -- R [ KW["url"] KW[":"] _1 ],
   Extends              -- R [ KW["extends"] KW[":"] _1 ],
   Aliases              -- R [ KW["aliases"] KW[":"] _1 ],
   LineCommentPrefix    -- R [ H [ KW["line"] KW["comment"] ] KW[":"] _1 ],
   BlockCommentDefs     -- R [ H [ KW["block"] KW["comment"] ] KW[":"] _1 ],
   FenceDefs            -- R [ KW["fences"] KW[":"] A(l,l) [ _1 ] ],
   FenceDef             -- R [ _1 _2 ],
   BlockCommentDef      -- H [ _1 _2 _3 ],
   String               -- _1,
   NoContinuation       --,
   CommentLine          -- R [ H hs=0 [ KW["//"] _1 ]],
   EmptyLine            -- R [KW[""]],
   Token                -- _1,
   TK_IDENTIFIER        -- KW["identifier"],
   TK_NUMBER            -- KW["number"],
   TK_LAYOUT            -- KW["layout"],
   TK_STRING            -- KW["string"],
   TK_KEYWORD           -- KW["keyword"],
   TK_OPERATOR          -- KW["operator"],
   TK_VAR               -- KW["var"],
   TK_JUNK              -- KW["junk"],
   TK_UNKNOWN           -- KW["unknown"],
   NORMAL               -- ,
   BOLD                 -- KW["bold"],
   ITALIC               -- KW["italic"],
   BOLD_ITALIC          -- H [KW["bold"] KW["italic"]],
   ColorDefault         -- KW["_"],
   NoColor              -- ,
   ColorRGB             -- H  [_1 _2 _3],
   Outliner             -- V is=2 [H hs=0  [KW["outliner"] _1] V [_2]],
   Outliner.2:iter-star -- _1,
   Folding              -- V is=2 [H hs=0  [KW["folding"] _1] V [_2]],
   Folding.2:iter-star  -- _1,
   Sort                 -- _1,
   ListSort             -- _1 KW["*"],
   ConstructorOnly      -- H hs=0 [KW["_"] KW["."] _1],
   Constructor          -- _1,
   SortAndConstructor   -- H hs=0 [_1 KW["."] _2],
   Module               -- V vs = 1 [H  [KW["module"] _1] _2 _3 ],
   Module.3:iter-star   -- _1,
   Imports              -- V is=2 [KW["imports"] _1],
   Imports.1:iter       -- _1,
   Import               -- _1,
   ImportRenamed        -- H hs=0 [_1 KW["["] _2 KW["]"]],
   NoImports            -- 
]

