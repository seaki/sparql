module SPARQL; module Algebra
  class Operator
    ##
    # The SPARQL descending sort operator.
    #
    # @example
    #   (prefix ((foaf: <http://xmlns.com/foaf/0.1/>))
    #     (project (?name)
    #       (order ((desc ?name))
    #         (bgp (triple ?x foaf:name ?name)))))
    #
    # @see https://www.w3.org/TR/sparql11-query/#modOrderBy
    class Desc < Operator::Asc
      NAME = :desc
    end # Desc
  end # Operator
end; end # SPARQL::Algebra
