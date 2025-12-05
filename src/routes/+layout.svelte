<script>
	import { LinkHandler } from '$lib/utils/linkhandler.svelte';
	import '../app.css';

	let { children } = $props();
</script>

<svelte:head>
	<meta property="og:title" content="Philipp Proff">
    <meta property="og:description" content="This website is the contemporary representation of my works, thoughts and creativity.">
    <meta property="og:url" content="https://philippproff.eu/">
	<title>Portfolio | Philipp Proff</title>
</svelte:head>
<div class="bg-background text-text min-h-screen min-w-screen p-2 grid grid-cols-12">
	<h1 class="col-start-1 col-span-12 md:col-start-3 md:col-span-5 mb-8">
		<a href={LinkHandler("/")}>Projects</a> / <a href={LinkHandler("/info")}>About</a>
	</h1>
	{@render children()}
</div>

