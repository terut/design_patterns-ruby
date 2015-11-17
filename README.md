# Design Patterns in Ruby

Design Patterns in Ruby

Note: This repository is hand-copying for learning design patterns.

http://morizyun.github.io/blog/ruby-design-pattern-matome-mokuzi/

## 生成に関するパターン

### Abstract Factory

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

### Builder

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


http://morizyun.github.io/blog/ruby-design-pattern-12-builder/

### Factory Method

追加・変更・保守を容易にしたい時に使われる。

例えば、楽器工場を考えると、楽器工場の枠組み（共通部分）を持った基底クラス(InstrumentFactory)と、生成する楽器の選択を請け負うサブクラス（TrumpetFactory, SaxophoneFactory）を用意して、サブクラスにそれぞれの楽器(Trumpet, Saxophone)の生成を任せる。

構成要素は以下。

- ConcreteCreator: 実際にオブジェクトの生成を行う
- Product: ConcreteFactoryによって生成されるオブジェクト
- Creator: ConcreteFactoryの共通部分の処理を行う

メリットは以下。

- インスタンス(Product)の生成をサブクラスに任せて、生成部分を切り離すことで、結合度を下げて、追加・変更・保守を容易にすることができる


http://morizyun.github.io/blog/ruby-design-pattern-11-factory-method/

### Singleton

１つだけに限定されたインスタンスを複数のオブジェクト内で共有する場合に使われる。
作成したクラスは唯一１つだけのインスタンスを自身で作成し、システム内のどこでもその１つだけのインスタンスにアクセスできることが前提条件。

RubyだとSingletonモジュールがあってMix-inすれば良い。
クラス変数にインスタンスを代入しておき、それを外部から参照する形で実装される。
唯一のインスタンスの生成はマルチスレッド環境でもSingletonの前提条件を満たすようにスレッドセーフな実装をする必要があるので注意。


http://morizyun.github.io/blog/ruby-design-pattern-10-singleton/

## 構造に関するパターン

### Adapter

関連性・互換性のないオブジェクト同士を結びつける必要があり、かつ他のコンポーネントへの変更ができるようにしたい場面で使われる。

例えば、文字列をPrintする古いインタフェースを提供するクラス(OldPrinter)と新しいインタフェースを提供するクラス(Printer)があり、利用者側(Client)に新しいインタフェースを提供している場合に、古いクラス(OldPrinter)を再利用できるように橋渡し(Adapter)を用意する。

構成要素は以下。

- Target: インタフェースを既定する
- Client: Targetのメソッドを呼び出す
- Adaptee: 実際に動作する既存のクラス
- Adapter: Adapteeのインタフェースを変換してTarget向けのインタフェースを提供

クラス変更でも対応できるため、問題のクラスの理解があり、かつ変更が比較的少ないならクラス変更、オブジェクトが複雑または完全な理解がないならアダプタ適用というのが、クラス変更とアダプタ適用の勘所っぽい。


http://morizyun.github.io/blog/ruby-design-pattern-07-adapter/

### Composite

再帰的な構造をクラスで表現したい場合に使われる。
「全体-部分」（個別のオブジェクトと合成したオブジェクト）を同一のものとして捉え、「全体-部分」は同じインタフェースを継承する。

例えば、ディレクトリとフォルダについて考えると、ディレクトリとフォルダを同様のコンポーネントとして扱うことで、削除処理などを再帰的に行えるようにできる。
ディレクトリの中にディレクトリ・ファイルを追加でき、一覧と削除において、同一のものとみなして処理できる（再帰的にメソッドを呼び出せる）ということ。

構成要素は以下。

- Component: 全てのオブジェクトの基底となるクラス
- Leaf: プロセスの単純な構成要素、再帰しない
- Composite: コンポーネントの一つでサブコンポーネントで構成

メリットは以下。

- ファイルシステムなどの木構造を伴う再帰的なデータ構造を表現出来る
- 階層構造で表現されるオブジェクトの取り扱いを楽にする

Compositeが任意の深さのツリーを作れるようにしておくことが重要。


http://morizyun.github.io/blog/ruby-design-pattern-04-composite/

### Decorator

既存のオブジェクトに対して簡単に機能の追加したい場合に使われる。
レイヤ状に機能を積み重ねて、必要な機能を持つオブジェクトを作れる。

例えば、ファイルに行を足していくクラスを考えた場合、Decoratorとしてタイムスタンプや行番号を追加するクラスを用意し、出力を変更する。

構成要素は以下。

- ConcreteComponent: ベースとなる処理を持つオブジェクト
- Decorator: 追加する機能を持つ

メリットは以下。

- 既存のオブジェクトの中身を変更することなく、機能を追加できる
- 組み合わせで様々な機能を実現できる
- 継承よりも変更の影響を限定しやすい

RubyにはForwardableというクラスに対しメソッドの委譲機能を追加するモジュールがあるがあって、それを利用してWriterDecoratorをリファクタリングできる。
委譲の方法としては`method_missing`を使う方法もある。

- Forwardableモジュールを使う場合は、委譲しているメソッドを明確に表現出来る
- `method_missing`を使う場合は、メソッドが多い場合に使いやすく、間違いにくい

まずはForwardableを検討するのがよさそう。
またDecoratorをモジュール化することで同様の機能を実現したりもできる。


http://morizyun.github.io/blog/ruby-design-pattern-09-decorator/
