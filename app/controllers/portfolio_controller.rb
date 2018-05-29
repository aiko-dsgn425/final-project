require 'matrix'

class PortfolioController < ApplicationController
    
    def calculate_tangencyportfolio
        # *Inputs*
        # Risk-Free Rate
        # Co-Variance Matrix
        # Expected Returns Vector
        # One Vector
        # *Output*
        # Tangent Portfolio Weights Vector
        
        # Risk-Free Rate (decimal) is pulled from API
        @rf_rate = 0.005
        
        #Covariance Matrix
        @sigma_mat = Matrix[    [0.0100, 0.0018, 0.0011],
                                [0.0018, 0.0109, 0.0026],
                                [0.0011, 0.0026, 0.0199]    ]
        #Covariance Inverse Matrix
        @sigma_mat_inv = @sigma_mat.inverse
        
        #Expected Returns Vector
        @mu = Matrix.column_vector([0.0427,0.0015,0.0285])
        
        #Vector of Ones: total numbrer should reflect # of assets 
        @one_vec = Matrix.column_vector([1,1,1])
        
        #Expected Returns Vector minus Risk-Free Rate
        @mu_rf = @mu - @rf_rate*@one_vec
        
        #Matrix for the Numerator
        top_mat = @sigma_mat_inv * @mu_rf
        #Denominator
        bot_mat = @one_vec.transpose * top_mat
       
        #Tangency Portfolio Weights Vector
        @tangent_vec = top_mat / bot_mat
        
        @portfolio_expreturns = (@tangent_vec.transpose * @mu).[](0,0)
        portfolio_variance = (@tangent_vec.transpose * @sigma_mat * @tangent_vec).[](0,0)
        @portfolio_stdev = portfolio_variance ** (0.5)
        
        @portfolio_sharperatio = (@portfolio_expreturns - @rf_rate) / @portfolio_stdev
        
        render("/portfolio_templates/allocation_results.html.erb")
        
    end
    
end