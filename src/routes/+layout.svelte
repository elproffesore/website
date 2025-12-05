<script>
	import '../app.css';

	let { children } = $props();
</script>

<svelte:head>
	<meta property="og:title" content="Philipp Proff">
    <meta property="og:description" content="This website is the contemporary representation of my works, thoughts and creativity.">
    <meta property="og:url" content="https://philippproff.eu/">
	<title>Portfolio | Philipp Proff</title>
</svelte:head>
<div class="bg-background text-text min-h-screen min-w-screen p-8">
	{@render children()}
</div>

