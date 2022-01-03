module SPARQL; module Algebra
  class Operator
    ##
    # The SPARQL GraphPattern `bgp` operator.
    #
    # Query with `graph_name` set to false.
    #
    # @example SPARQL Grammar
    #   PREFIX : <http://example/>
    #   SELECT * { ?s ?p ?o }
    #
    # @example SSE
    #   (prefix ((: <http://example/>))
    #     (bgp (triple ?s ?p ?o)))
    #
    # @see https://www.w3.org/TR/sparql11-query/#sparqlAlgebra
    class BGP < Operator
      NAME = [:bgp]
      ##
      # A `graph` is an RDF::Query with a graph_name.
      #
      # @overload self.new(*patterns)
      #   @param [Array<RDF::Query::Pattern>] patterns
      # @yield  [solution]
      #   each matching solution
      # @yieldparam  [RDF::Query::Solution] solution
      # @yieldreturn [void] ignored
      # @return [RDF::Query]
      def self.new(*patterns, **options, &block)
        RDF::Query.new(*patterns, graph_name: false, &block)
      end
    end # BGP
  end # Operator
end; end # SPARQL::Algebra
