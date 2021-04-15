defmodule ElixirAnalyzer.TestSuite.BirdCount do
  @dialyzer generated: true
  @moduledoc """
  This is an exercise analyzer extension module for the concept exercise Bird Count
  """

  use ElixirAnalyzer.ExerciseTest

  assert_no_call "does not call any Enum functions" do
    type :essential
    called_fn module: Enum, name: :_
    comment ElixirAnalyzer.Constants.bird_count_use_recursion()
  end

  assert_no_call "does not call any Stream functions" do
    type :essential
    called_fn module: Stream, name: :_
    comment ElixirAnalyzer.Constants.bird_count_use_recursion()
  end

  assert_no_call "does not call any List functions" do
    type :essential
    called_fn module: List, name: :_
    comment ElixirAnalyzer.Constants.bird_count_use_recursion()
  end

  # TODO: also detect aliasing and importing those modules

  feature "doesn't use list comprehensions" do
    find :none
    type :essential
    comment ElixirAnalyzer.Constants.bird_count_use_recursion()

    form do
      for _ignore <- _ignore do
        _ignore
      end
    end

    form do
      for _ignore <- _ignore, _ignore do
        _ignore
      end
    end

    form do
      for _ignore <- _ignore, _ignore, into: _ignore do
        _ignore
      end
    end
  end
end
