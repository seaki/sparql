module SPARQL; module Algebra
  class Operator
    ##
    # The SPARQL GraphPattern `reduced` operator.
    #
    # [9] SelectClause ::= 'SELECT' ( 'DISTINCT' | 'REDUCED' )? ( ( Var | ( '(' Expression 'AS' Var ')' ) )+ | '*' )
    #
    # @example SPARQL Grammar
    #   PREFIX : <http://example.org/>
    #   PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
    #   SELECT REDUCED ?v
    #   WHERE { ?x ?p ?v }
    #
    # @example SSE
    #   (prefix ((: <http://example.org/>)
    #            (xsd: <http://www.w3.org/2001/XMLSchema#>))
    #     (reduced
    #       (project (?v)
    #         (bgp (triple ?x ?p ?v)))))
    #
    # @see https://www.w3.org/TR/sparql11-query/#sparqlAlgebra
    class Reduced < Operator::Unary
      include Query
      
      NAME = [:reduced]

      ##
      # Executes this query on the given `queryable` graph or repository.
      # Removes duplicate solutions from the solution set.
      #
      # @param  [RDF::Queryable] queryable
      #   the graph or repository to query
      # @param  [Hash{Symbol => Object}] options
      #   any additional keyword options
      # @yield  [solution]
      #   each matching solution
      # @yieldparam  [RDF::Query::Solution] solution
      # @yieldreturn [void] ignored
      # @return [RDF::Query::Solutions]
      #   the resulting solution sequence
      # @see    https://www.w3.org/TR/sparql11-query/#sparqlAlgebra
      def execute(queryable, **options, &block)
        @solutions = operands.last.
          execute(queryable, **options.merge(depth: options[:depth].to_i + 1)).reduced
        @solutions.each(&block) if block_given?
        @solutions
      end

      ##
      #
      # Returns a partial SPARQL grammar for this operator.
      #
      # @return [String]
      def to_sparql(**options)
        operands.first.to_sparql(reduced: true, **options)
      end
    end # Reduced
  end # Operator
end; end # SPARQL::Algebra
