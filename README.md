# Design Patterns in Ruby

Design Patterns in Ruby

Note: This repository is hand-copying for learning design patterns.

http://morizyun.github.io/blog/ruby-design-pattern-matome-mokuzi/

## Abstract Factory

矛盾のないオブジェクトの組み合わせを作る。

例えば、池の環境の制約として以下があるとする。

- 池の環境（動物と植物の組み合わせ）は2種類のみが許されている
  - アヒル(Duck)とスイレン(WaterLily)
  - カエル(Frog)と藻(Algae)

この制約に沿った矛盾のないオブジェクト群を作成をするため、基底クラス(OrganismFactory)を継承したファクトリークラス(FrogAndAlgaeFactory, DuckAndWaterLilyFactory)を用意する。

http://morizyun.github.io/blog/ruby-design-pattern-14-abstract-factory/
