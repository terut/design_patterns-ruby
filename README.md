# Design Patterns in Ruby

Design Patterns in Ruby

Note: This repository is hand-copying for learning design patterns.

http://morizyun.github.io/blog/ruby-design-pattern-matome-mokuzi/

## Abstract Factory

矛盾のないオブジェクトの組み合わせを作りたい時に使われる。

例えば、池の環境の制約として以下があるとする。

- 池の環境（動物と植物の組み合わせ）は2種類のみが許されている
  - アヒル(Duck)とスイレン(WaterLily)
  - カエル(Frog)と藻(Algae)

この制約に沿った矛盾のないオブジェクト群を作成をするため、基底クラス(OrganismFactory)を継承したファクトリークラス(FrogAndAlgaeFactory, DuckAndWaterLilyFactory)を用意する。

構成要素は以下。

- ConcreteFactory: 実際にオブジェクトの生成を行う
  - FrogAndAlgaeFactory, DuckAndWaterLilyFactory
- Product: CocreateFactoryによって生成されるオブジェクト
  - Duck, Frog, WaterLily, Algae
- AbstractFactory: ConreteFactoryの共通部分の処理を行う
  - OrganismFactory

メリットは以下。

- 関連し合うオブジェクトの集まりを生成できる
- 整合性が必要となるオブジェクト群を誤りなしに生成できる


http://morizyun.github.io/blog/ruby-design-pattern-14-abstract-factory/

## Builder

オブジェクトを作り出すことが難しい時に使われる。
大量のコードが必要であったり、生成時に必要なチェックを行いたいなら考慮すると良さそう。

例えば、加工水（塩水、砂糖水）を作りたい場合を考えると、加工水を作るためのインタフェースを備えたビルダークラス(WaterWithMaterialBuilder)と、ビルダークラスのインタフェースのみを使って加工水を作成していくディレクタークラス(Director)を用意する。

構成要素は以下。

- Builder: 各メソッドのインタフェースを定める
  - WaterWithMaterialBuilder
- Director: Builderで提供されているインタフェースのみを使用して処理を行う
  - Director
- ConcreteBuilder: Builderが定めたインタフェースの実装
  - SugarWater, SaltWater

メリットは以下。

- 作成過程を決定するDirectorと作業インタフェースを持つBuilderを組み合わせることで、柔軟にオブジェクトを生成することができる

