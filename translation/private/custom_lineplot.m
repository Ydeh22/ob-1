function custom_lineplot(plot_fun, x, y, mode_sel)
    subplot 111;
    for i = 1 : length(y) 
        if isempty(x)
            x = 1 : size(y{i}, 2);
        end

        plot_fun(x, y{i}', 'k-');
        hold on 
        if any(i == mode_sel)
            for j = 1 : size(y{i}, 1)
                plot_fun(x, y{i}(j,:), my_linestyle(i,j), 'MarkerSize', 8);
            end
        end
    end
    hold off
end


function [linestyle] = my_linestyle(i, j)
    linecolors =  'bgrcm';
    linemarkers = '.+x*osd';
    color_ind = mod(i-1, length(linecolors)) + 1;
    marker_ind = mod(j-1, length(linemarkers)) + 1;
    linestyle = [linecolors(color_ind), linemarkers(marker_ind), '-'];
end
