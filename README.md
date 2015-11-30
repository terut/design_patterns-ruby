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


### Proxy

一つのオブジェクトに複数の関心事がある場合に、関心事を分離するために使われる。
例えば、銀行の窓口業務（入金/出金）とユーザ認証を考えた場合、ユーザ認証という関心事を分離した窓口業務クラス(Subject)とユーザ認証クラス(Proxy)を用意したり、システム全体の性能向上のためのインスタンス生成のタイミングを遅らせるという関心事を分離したクラスを用意したりといった感じになる。
他にもオブジェクトの本質的な目的とは異なるセキュリティ要件やトランザクションの管理などを切り離して実装することができる。

タイプ的には防御Proxy(ユーザ認証)、仮想Proxy(生成タイミングの遅延)、リモートProxyみたいに分けられるとのこと。

構成要素は以下。

- Subject: 本物のオブジェクト
- Proxy: 特定の関心事を担当、それ以外を対象Subjectに渡す

Proxyは対象のSubjectと同じインタフェースを持ち、利用する際はProxyを通して対象となるSubjectを操作する。

メリットは以下。

- オブジェクトの本質的な目的とは異なる関心事を分離できる

Rubyには`method_missing`があるので、`method_missing`を利用したProxyという実装もできる。
Forwardableと同じ委譲の仕方の一つという捉え方ができるが、ソースコードが追いづらくなり、マシンパワーを消費するので、使用は用法用量を守って使うのが大事。

Adapter/Decorator/Proxyをここまででやったが、いずれも別のオブジェクトの代理をするパターンだった。
違いは以下のようになる。

- Adapter: オブジェクトの不適切なインタフェースをラップする
- Decorator: 基本的にオブジェクトにレイヤ状に機能を追加する
- Proxy: ラップするオブジェクトと同じインタフェースを持ち、一部の機能を受け持つ

http://morizyun.github.io/blog/ruby-design-pattern-08-proxy/

## 振る舞いに関するパターン

### Command

オブジェクトに対してコマンドを送り、オブジェクトのメソッドを呼び出すことができる。
例えばファイルシステムの実装は知らなくてもユーザはファイルの追加、削除といったコマンドを実行できる。

構成要素は以下。

- Command: コマンドのインタフェース
- ConcreteCommand: Commandの具体的な処理

メリットは以下。

- コマンドの変更・追加・削除に対して柔軟になる

http://morizyun.github.io/blog/ruby-design-pattern-06-command/

### Interpreter

一つ一つの問題はシンプルでも、組み合わさって複雑になる様な場合に使われる。
専用の言語を作り、その言語で得られた手順に基づいて処理を実行していく。

例えば、ファイルを条件を組み合わせて検索したい場合に、条件で絞り組むクラス(TerminalExpression)を用意し、結合用のクラス(NonterminalExpression)を使って条件を組み合わせる。

構成要素は以下。

- AbstractExpression: 共通のインタフェースを定義
- TerminalExpression: 終端を表現するクラス
- NonterminalExpression: 非終端を表現するクラス
- Context: 構文の分析を手助けする

http://morizyun.github.io/blog/ruby-design-pattern-13-interpreter/

### Iterator

要素の集まったオブジェクト（配列など）にアクセスしたい場合や集合の要素に順にアクセスする必要がある場合に使われる。

Iteratorの定義は「集約オブジェクトが元にある内部表現を公開せずに、その要素に順にアクセスする方法を提供する」とGoFではなっている。

RubyのeachのようなコードブロクベースのIteratorを内部Iteratorと呼ぶ。
今回は外部Iteratorについて考える。

構成要素は以下。

- Item: 個別の要素
- Aggregate: 複数のItemを持つオブジェクト
- Iterator: AggregateのItemにアクセスするためのクラス


RubyにはEnumerableモジュールがあって、includeすることにより、集約オブジェクト向けの`all?`や`any?`、`include?`といった便利なメソッドを取り込める。

http://morizyun.github.io/blog/ruby-design-pattern-05-iterator/

### Observer

Aで起きたイベントをB, Cが知る必要がある場合などに使われる。
オブジェクトの状態が変化する可能性があり、変化したことを他のオブジェクトに通知する必要があれば、一考すると良い。

構成要素は以下。

- Subject: 状態が変化するオブジェクト
- Observer: Subjectの状態の変化を関連するオブジェクトに通知するインタフェース
- ConcreteObserver: 状態の変化に関連して具体的な処理を行う

メリットは以下。

- オブジェクト間の依存度を下げることができる
- 通知先の管理をオブザーバが行うことで、サブジェクトは通知側を意識しなくて良い

RubyにはObservableというモジュールがあり、Observableがオブザーバとしての機能を引き受ける。


http://morizyun.github.io/blog/ruby-design-pattern-03-Observer/

### Strategy

コンテキストによってアルゴリズムを交換したい場合に使われる。
例えば、5ステップの中の3ステップが異なったAとBがあって、このAとBをスイッチしたい時に使える。

構成要素は以下。

- Context: ストラテジの利用者
- Strategy: 同じ目的を持った一連のオブジェクトを抽象化したもの
- ConcreteStrategy: 具体的なアルゴリズム

メリットは以下。

- 使用するアルゴリズムに多様性を持たせることができる
- コンテキストと戦略を分離することでデータも分離できる
- 継承よりもストラテジを切り替えるのが楽

Strategyの注意点として、

- コンテキストとストラテジ間のインタフェースがストラテジの種類の増加を妨げないようにする
- コンテキストの変更がストラテジに影響を与えないようにする

というのがある。
コンテキストからストラテジへのデータの渡し方は、ストラテジメソッドを呼び出すときに適切なデータを渡すか、コンテキストへの参照をストラテジに渡す方法があるが、適切に選択しないとストラテジの種類の追加を阻害してしまうので、注意が必要。

StrategyとObserverの違い

- Observer: 発生しているオブジェクトに対してイベントを通知する
- Strategy: 何らかの処理を行うためにオブジェクトを取得する

http://morizyun.github.io/blog/ruby-design-pattern-02-Strategy/

### Template Method

2つのコードのやりたいこと（アルゴリズム）がほとんど同じである一部だけ変えたいような時に使われる。
例としてレポートの出力フォーマットを変えるといったことが考えられる。

構成要素は以下。

- Abstract: 骨格としての「抽象的なベースのクラス」
- Cocrete:  実際の処理を行うサブクラス

メリットは以下。

- 抽象的なベースのクラス側に「変わらない基本的なアルゴリズム」を置ける
- 抽象的なベースのクラスは「高レベルの処理（抽象度が高い、ロジック的な、処理のフレーム）」を制御することに集中出来る
- サブクラス側に「変化するロジック」を置ける
- サブクラスは「詳細を埋めること」に集中出来る

Template Methodの注意点として

- YAGNI = You Aren't Going to Need It.（今必要なことだけ行う）を徹底する
- 解決したい問題に絞って単純なコードを書いていくこと

がある。

Rubyの`initalize`などは既存をオーバーライドして初期化処理を行えるので、広義でのTemplate Methodと言える。

http://morizyun.github.io/blog/ruby-design-pattern-01-template-engine/

