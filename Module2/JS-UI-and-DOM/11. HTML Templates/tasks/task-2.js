/* globals $ */

function solve() {
  
  return function (selector) {
    var template =  '<div class="container">' +
                    '<h1>Animals</h1>' +
                    '<ul class="animals-list">' +
                    '{{#animals}}' +
                    '<li>' +
                    '<a href="' +
                    '{{#if url}}' +
                    '{{url}}' +
                    '{{/if}}' +
                    '{{#unless url}}' +
                    'http://cdn.playbuzz.com/cdn/3170bee8-985c-47bc-bbb5-2bcb41e85fe9/d8aa4750-deef-44ac-83a1-f2b5e6ee029a.jpg' +
                    '{{/unless}}' +
                    '">' +
                    '{{#if url}}' +
                    'See a {{name}}' +
                    '{{/if}}' +
                    '{{#unless url}}' +
                    'No link for {{name}} , here is Batman!' +
                    '{{/unless}}' +
                    '</a>' +
                    '</li>' +
                    '{{/animals}}' +
                    '</ul>' +
                    '</div>';


    $(selector).html(template);   
  };
}

module.exports = solve;