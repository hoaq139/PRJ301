/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function renderPagger(id, pageIndex, totalPage, gap)
{
    var container = document.getElementById(id);
    
    if (pageIndex - gap >= 1)
        container.innerHTML += '<a href="search?page=1">First</a>';
    for (var i = pageIndex - gap; i < pageIndex; i++) {
        if (i > 0) {
            container.innerHTML += '<a href="search?page=' + i + '">' + i + '</a>';
        }
    }
    container.innerHTML += '<span>' + pageIndex + '</span>';
    for (var i = pageIndex + 1; i <= pageIndex + gap; i++) {
        if (i <= totalPage) {
            container.innerHTML += '<a href="search?page=' + i + '">' + i + '</a>';
        }
    }

    if (pageIndex + gap < totalPage)
        container.innerHTML += '<a href="search?page=' + totalPage + '">Last</a>';

}


