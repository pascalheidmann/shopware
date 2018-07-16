{extends file="backend/benchmark/template/local/index.tpl"}

{block name="benchmark_index_head_scripts"}
	{$smarty.block.parent}
	<script type="text/javascript" src="{link file="backend/base/frame/postmessage-api.js"}"></script>
{/block}

{block name="benchmark_index_title"}Shopware BI - Waiting{/block}

{block name="benchmark_index_head_scripts"}
    {$smarty.block.parent}
    <script src="{link file='backend/benchmark/template/local/js/pong.js'}"></script>
{/block}

{block name="benchmark_index_body"}
    <body id="swag-waiting">
        {include file="backend/benchmark/template/local/include/loading_indicator.tpl"}
        {include file="backend/benchmark/template/local/include/language_switch.tpl"}
        <div class="wrapper swag-onbording waiting">
            <div class="row">
                <div class="col-100">
                    <div class="opener">
                        <h1>[[ $t('waitingHeadline{$waitingSinceDays}') ]]</h1>
                    </div>
                    <p>[[ $t('waitingText{$waitingSinceDays}') ]]</p>
                </div>

                <div class="col-100">
                    {if $waitingSinceDays <= 1}
                        <div class="compare-no-apples-and-pears"></div>
                    {elseif $waitingSinceDays <= 2}
                        <div class="eat-fruits-while-waiting"></div>
                    {elseif $waitingSinceDays <= 3}
                        <div class="no-fruits-no-fun"></div>
                    {else}
                        <canvas id="pong-game" data-pong="true"></canvas>
                        <input class="btn secondary pong-start" type="button" value="Start" />
                    {/if}
                </div>

                <div class="col-100">
                    <button class="btn primary{if $waitingSinceDays >= 4} pong-cancel-button{/if}" onclick="window.parent.postMessage('closeWindow', window.location.origin)">
                        [[ $t('waitingButton{$waitingSinceDays}') ]]
                    </button>
                </div>
            </div>
            <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" class="circle big">
                <circle cx="50" cy="50" r="50">
            </svg>
            <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" class="circle small">
                <circle cx="50" cy="50" r="50">
            </svg>
        </div>
    </body>
{/block}